/*
 * Unified Rocket/BOOM benchmark.
 *
 * RISC-V build:
 *   - FPGA mode writes results to the PS-visible MMIO mailbox.
 *   - VERILATOR_RUN mode stores results locally, prints through the
 *     simulated UART, and terminates through tohost.
 *
 * ARM/Linux build:
 *   - Reads and validates the FPGA mailbox through /dev/mem.
 *
 * The runtime implementation is identified by marchid and the executing
 * hart is identified by mhartid. No build-time core marker is required.
 */

#include <stdint.h>
#include "marchid.h"

#define MMIO_GPIO_BASE      0x60000000UL
#define RESULT_BASE_MMIO    0x60010000UL
#define N_ITER              100000UL

#define CRC_TEST_LEN        256u
#define MAT_DIM             8u
#define MAT_REPS            2000u

enum {
    RES_MAGIC = 0,
    RES_VERSION,
    RES_STATUS,             /* byte offset 8, used by trap asm */
    RES_N_ITER,

    RES_DEP_CYCLES,
    RES_DEP_INSTS,
    RES_DEP_IPC_X1000,
    RES_DEP_CHECKSUM,

    RES_ILP_CYCLES,
    RES_ILP_INSTS,
    RES_ILP_IPC_X1000,
    RES_ILP_CHECKSUM,

    RES_RATIO_X1000,

    RES_TRAP_MCAUSE,        /* byte offset 52, used by trap asm */
    RES_TRAP_MEPC,          /* byte offset 56, used by trap asm */
    RES_TRAP_MTVAL,         /* byte offset 60, used by trap asm */

    RES_CRC_LEN,
    RES_CRC_CYCLES,
    RES_CRC_INSTS,
    RES_CRC_CHECKSUM,

    RES_FINAL_MARKER,

    /* Added after the old mailbox layout so trap offsets stay unchanged. */
    RES_RESERVED_CORE_ID,
    RES_MISA_LO,
    RES_MISA_HI,
    RES_MARCHID,
    RES_MIMPID,

    RES_MAT_DIM,
    RES_MAT_REPS,
    RES_MAT_CYCLES,
    RES_MAT_INSTS,
    RES_MAT_IPC_X1000,
    RES_MAT_CHECKSUM,

    RES_MHARTID,

    RES_COUNT
};

#define MAGIC_VALUE      0xB00BCAFEu
#define VERSION_VALUE    0x00000033u

#define STATUS_C_ENTRY   0x55555005u
#define STATUS_DEP_DONE  0xD1000000u
#define STATUS_ILP_DONE  0xD2000000u
#define STATUS_CRC_DONE  0xD3000000u
#define STATUS_MAT_DONE  0xD4000000u
#define STATUS_DONE      0xDEADBEEFu
#define STATUS_TRAP      0xBAD00001u

static void gen_test_data(uint8_t *buf, uint32_t len)
{
    for (uint32_t i = 0; i < len; i++)
        buf[i] = (uint8_t)((i * 31u + 17u) & 0xFFu);
}

static uint32_t crc32_compute(const uint8_t *data, uint32_t len)
{
    uint32_t crc = 0xFFFFFFFFu;

    for (uint32_t i = 0; i < len; i++) {
        crc ^= data[i];
        for (int b = 0; b < 8; b++) {
            uint32_t mask = -(crc & 1u);
            crc = (crc >> 1) ^ (0xEDB88320u & mask);
        }
    }

    return crc ^ 0xFFFFFFFFu;
}

#if defined(__riscv)

#define GPIO_REG (*(volatile uint32_t *)(MMIO_GPIO_BASE))

#ifdef VERILATOR_RUN
/* The FPGA mailbox is outside simulated DRAM. Keep results locally in sim. */
static volatile uint32_t sim_results[RES_COUNT];
#define RESULTS sim_results
#else
#define RESULTS ((volatile uint32_t *)(RESULT_BASE_MMIO))
#endif

#ifdef VERILATOR_RUN

#define UART0_BASE   0x10020000UL
#define UART_TXDATA  (*(volatile uint32_t *)(UART0_BASE + 0x00UL))
#define UART_TXCTRL  (*(volatile uint32_t *)(UART0_BASE + 0x08UL))
#define UART_DIV     (*(volatile uint32_t *)(UART0_BASE + 0x18UL))

/*
 * The Verilator TestHarness/FESVR watches the ELF symbol "tohost".
 * Writing 1 means that the bare-metal program completed successfully.
 */
volatile uint64_t tohost
    __attribute__((section(".tohost"), aligned(64), used)) = 0;
volatile uint64_t fromhost
    __attribute__((section(".fromhost"), aligned(64), used)) = 0;

static void sim_uart_init(void)
{
    /* SoC UART input clock is 100 MHz; 100 MHz / 115200 - 1 = 867. */
    UART_DIV = 867u;
    UART_TXCTRL = 1u;
}

static void sim_putchar(char c)
{
    if (c == '\n')
        sim_putchar('\r');

    /* TXDATA[31] is set while the transmit FIFO is full. */
    while ((UART_TXDATA & 0x80000000u) != 0u)
        ;

    UART_TXDATA = (uint32_t)(uint8_t)c;
}

static void sim_puts(const char *s)
{
    while (*s != '\0')
        sim_putchar(*s++);
}

static void sim_print_hex32(uint32_t value)
{
    static const char digits[] = "0123456789abcdef";

    sim_puts("0x");
    for (int shift = 28; shift >= 0; shift -= 4)
        sim_putchar(digits[(value >> shift) & 0xfu]);
}

static void sim_print_u32(uint32_t value)
{
    char digits[10];
    uint32_t count = 0;

    if (value == 0u) {
        sim_putchar('0');
        return;
    }

    while (value != 0u) {
        digits[count++] = (char)('0' + (value % 10u));
        value /= 10u;
    }

    while (count != 0u)
        sim_putchar(digits[--count]);
}

__attribute__((noreturn))
static void sim_exit_success(void)
{
    asm volatile ("fence iorw, iorw" ::: "memory");
    tohost = 1u;
    asm volatile ("fence iorw, iorw" ::: "memory");

    while (1)
        asm volatile ("wfi");
}

#endif

__attribute__((noinline, used))
int main_bench(void);

static inline void result_write(uint32_t index, uint32_t value)
{
    RESULTS[index] = value;
    asm volatile ("fence iorw, iorw" ::: "memory");
}

static inline void mmio_write(uint32_t value)
{
#ifdef VERILATOR_RUN
    /* The 0x60000000 GPIO is implemented by the FPGA/PS integration only. */
    (void)value;
#else
    GPIO_REG = value;
    asm volatile ("fence iorw, iorw" ::: "memory");
#endif
}

static inline void delay_small(uint32_t n)
{
    asm volatile (
        "1:\n"
        "addi %[n], %[n], -1\n"
        "bnez %[n], 1b\n"
        : [n] "+r"(n)
        :
        : "memory"
    );
}

#ifdef VERILATOR_RUN

/*
 * Simulation startup deliberately avoids all FPGA-only MMIO accesses.
 * The trap path reports failure directly through the HTIF tohost symbol.
 */
__asm__ (
    ".section .text.init,\"ax\",@progbits\n"
    ".globl _start\n"
    "_start:\n"
    ".option push\n"
    ".option norvc\n"

    "la   t0, sim_trap_vector\n"
    "csrw mtvec, t0\n"

    /* RV64-safe stack: sp = 0x0000000080020000. */
    "li   sp, 1\n"
    "slli sp, sp, 31\n"
    "lui  t0, 0x20\n"
    "add  sp, sp, t0\n"

    "call main_bench\n"

    /* Returning unexpectedly is a failed test (HTIF value 3). */
    "la   t0, tohost\n"
    "li   t1, 3\n"
    "sd   t1, 0(t0)\n"
    "1:\n"
    "wfi\n"
    "j 1b\n"

    ".balign 4\n"
    "sim_trap_vector:\n"
    "la   t0, tohost\n"
    "li   t1, 3\n"
    "sd   t1, 0(t0)\n"
    "2:\n"
    "wfi\n"
    "j 2b\n"

    ".option pop\n"
);

#else

__asm__ (
    ".section .text.init,\"ax\",@progbits\n"
    ".globl _start\n"
    "_start:\n"
    ".option push\n"
    ".option norvc\n"

    "la   t2, trap_vector\n"
    "csrw mtvec, t2\n"
    "j normal_start\n"

    "trap_vector:\n"
    "csrr t3, mcause\n"
    "csrr t4, mepc\n"
    "csrr t5, mtval\n"

    "lui  t1, 0x60000\n"
    "lui  t0, 0xBAD00\n"
    "addi t0, t0, 1\n"
    "sw   t0, 0(t1)\n"

    "lui  t1, 0x60010\n"
    "sw   t0, 8(t1)\n"
    "sw   t3, 52(t1)\n"
    "sw   t4, 56(t1)\n"
    "sw   t5, 60(t1)\n"

    "trap_loop:\n"
    "j trap_loop\n"

    "normal_start:\n"
    "lui  t1, 0x60000\n"

    "lui  t0, 0x11111\n"
    "addi t0, t0, 1\n"
    "sw   t0, 0(t1)\n"

    "addi t0, t0, 1\n"
    "sw   t0, 0(t1)\n"

    "lui  t0, 0x22222\n"
    "addi t0, t0, 2\n"
    "sw   t0, 0(t1)\n"

    /* RV64-safe stack: sp = 0x0000000080020000. */
    "li   sp, 1\n"
    "slli sp, sp, 31\n"
    "lui  t0, 0x20\n"
    "add  sp, sp, t0\n"

    "lui  t0, 0x33333\n"
    "addi t0, t0, 3\n"
    "sw   t0, 0(t1)\n"

    "lui  t0, 0x66666\n"
    "addi t0, t0, 1\n"
    "sw   t0, 0(t1)\n"

    "lui  t0, 0x12345\n"
    "addi t0, t0, 0x678\n"
    "sw   t0, 0(sp)\n"

    "lui  t0, 0x66666\n"
    "addi t0, t0, 2\n"
    "sw   t0, 0(t1)\n"

    "call main_bench_entry\n"

    "1:\n"
    "j 1b\n"

    ".option pop\n"
);

__asm__ (
    ".section .text,\"ax\",@progbits\n"
    ".globl main_bench_entry\n"
    "main_bench_entry:\n"
    ".option push\n"
    ".option norvc\n"

    "lui  t1, 0x60000\n"
    "lui  t0, 0x44444\n"
    "addi t0, t0, 4\n"
    "sw   t0, 0(t1)\n"

    "j main_bench\n"

    ".option pop\n"
);

#endif

static inline uint32_t rdcycle32(void)
{
    uint32_t x;
    asm volatile ("csrr %0, mcycle" : "=r"(x));
    return x;
}

static inline uint32_t rdinstret32(void)
{
    uint32_t x;
    asm volatile ("csrr %0, minstret" : "=r"(x));
    return x;
}

static inline uint32_t read_misa_lo(void)
{
#if __riscv_xlen == 64
    uint64_t x;
    asm volatile ("csrr %0, misa" : "=r"(x));
    return (uint32_t)x;
#else
    uint32_t x;
    asm volatile ("csrr %0, misa" : "=r"(x));
    return x;
#endif
}

static inline uint32_t read_misa_hi(void)
{
#if __riscv_xlen == 64
    uint64_t x;
    asm volatile ("csrr %0, misa" : "=r"(x));
    return (uint32_t)(x >> 32);
#else
    return 0;
#endif
}

static inline uint32_t read_marchid(void)
{
    uint32_t x;
    asm volatile ("csrr %0, marchid" : "=r"(x));
    return x;
}

static inline uint32_t read_mimpid(void)
{
    uint32_t x;
    asm volatile ("csrr %0, mimpid" : "=r"(x));
    return x;
}

static inline uint32_t read_mhartid(void)
{
    uint32_t x;
    asm volatile ("csrr %0, mhartid" : "=r"(x));
    return x;
}

static inline void fence_io(void)
{
    asm volatile ("fence iorw, iorw" ::: "memory");
}

__attribute__((noinline))
static uint32_t bench_dependent(uint32_t n)
{
    uint32_t a = 1;

    asm volatile (
        "1:\n"
        "addi %[a], %[a], 1\n" "addi %[a], %[a], 1\n"
        "addi %[a], %[a], 1\n" "addi %[a], %[a], 1\n"
        "addi %[a], %[a], 1\n" "addi %[a], %[a], 1\n"
        "addi %[a], %[a], 1\n" "addi %[a], %[a], 1\n"
        "addi %[a], %[a], 1\n" "addi %[a], %[a], 1\n"
        "addi %[a], %[a], 1\n" "addi %[a], %[a], 1\n"
        "addi %[a], %[a], 1\n" "addi %[a], %[a], 1\n"
        "addi %[a], %[a], 1\n" "addi %[a], %[a], 1\n"
        "addi %[n], %[n], -1\n"
        "bnez %[n], 1b\n"
        : [a] "+r"(a), [n] "+r"(n)
        :
        : "memory"
    );

    return a;
}

__attribute__((noinline))
static uint32_t bench_ilp(uint32_t n)
{
    uint32_t a0 = 1, a1 = 2, a2 = 3, a3 = 4;
    uint32_t a4 = 5, a5 = 6, a6 = 7, a7 = 8;

    asm volatile (
        "1:\n"
        "addi %[a0], %[a0], 1\n" "addi %[a1], %[a1], 2\n"
        "addi %[a2], %[a2], 3\n" "addi %[a3], %[a3], 4\n"
        "addi %[a4], %[a4], 5\n" "addi %[a5], %[a5], 6\n"
        "addi %[a6], %[a6], 7\n" "addi %[a7], %[a7], 8\n"
        "addi %[n], %[n], -1\n"
        "bnez %[n], 1b\n"
        : [n] "+r"(n),
          [a0] "+r"(a0), [a1] "+r"(a1), [a2] "+r"(a2), [a3] "+r"(a3),
          [a4] "+r"(a4), [a5] "+r"(a5), [a6] "+r"(a6), [a7] "+r"(a7)
        :
        : "memory"
    );

    return a0 + a1 + a2 + a3 + a4 + a5 + a6 + a7;
}

static uint8_t crc_buf[CRC_TEST_LEN];

__attribute__((noinline))
static uint32_t bench_crc(const uint8_t *data, uint32_t len)
{
    return crc32_compute(data, len);
}

static uint32_t mat_a[MAT_DIM][MAT_DIM] __attribute__((aligned(64)));
static uint32_t mat_b[MAT_DIM][MAT_DIM] __attribute__((aligned(64)));
static uint32_t mat_c[MAT_DIM][MAT_DIM] __attribute__((aligned(64)));

static void init_mats(void)
{
    for (uint32_t i = 0; i < MAT_DIM; i++) {
        for (uint32_t j = 0; j < MAT_DIM; j++) {
            mat_a[i][j] = (i * 13u + j * 7u + 3u) & 0xFFu;
            mat_b[i][j] = (i * 5u + j * 11u + 1u) & 0xFFu;
            mat_c[i][j] = 0;
        }
    }
}

/*
 * Matrix benchmark:
 *  - small enough to stay cache-resident
 *  - enough independent multiply/add work for BOOM to overlap
 *  - checksum prevents the compiler from deleting the work
 */
__attribute__((noinline))
static uint32_t bench_matmul(uint32_t reps)
{
    uint32_t checksum = 0;

    for (uint32_t r = 0; r < reps; r++) {
        for (uint32_t i = 0; i < MAT_DIM; i++) {
            for (uint32_t j = 0; j < MAT_DIM; j += 4) {
                uint32_t s0 = mat_c[i][j + 0];
                uint32_t s1 = mat_c[i][j + 1];
                uint32_t s2 = mat_c[i][j + 2];
                uint32_t s3 = mat_c[i][j + 3];

                for (uint32_t k = 0; k < MAT_DIM; k++) {
                    uint32_t a = mat_a[i][k];
                    uint32_t b0 = mat_b[k][j + 0];
                    uint32_t b1 = mat_b[k][j + 1];
                    uint32_t b2 = mat_b[k][j + 2];
                    uint32_t b3 = mat_b[k][j + 3];

                    s0 += a * b0;
                    s1 += a * b1;
                    s2 += a * b2;
                    s3 += a * b3;
                }

                mat_c[i][j + 0] = s0;
                mat_c[i][j + 1] = s1;
                mat_c[i][j + 2] = s2;
                mat_c[i][j + 3] = s3;
            }
        }
    }

    for (uint32_t i = 0; i < MAT_DIM; i++) {
        for (uint32_t j = 0; j < MAT_DIM; j++)
            checksum ^= mat_c[i][j] + (checksum << 5) + (checksum >> 2);
    }

    return checksum;
}

static uint32_t calc_ipc_x1000_safe(uint32_t insts, uint32_t cycles)
{
    if (cycles == 0u)
        return 0u;

    return (uint32_t)(((uint64_t)insts * 1000u) / cycles);
}

__attribute__((noinline, used))
int main_bench(void)
{
    uint32_t c0, c1, i0, i1;
    uint32_t dep_cycles, dep_insts, dep_ipc, dep_checksum;
    uint32_t ilp_cycles, ilp_insts, ilp_ipc, ilp_checksum;
    uint32_t crc_cycles, crc_insts, crc_checksum;
    uint32_t mat_cycles, mat_insts, mat_ipc, mat_checksum;
    uint32_t ratio_x1000;

#ifdef VERILATOR_RUN
    sim_uart_init();
    sim_puts("\n[benchmark] entered main_bench\n");
#endif

    for (uint32_t idx = 0; idx < RES_COUNT; idx++)
        result_write(idx, 0);

    result_write(RES_MAGIC, MAGIC_VALUE);
    result_write(RES_VERSION, VERSION_VALUE);
    result_write(RES_STATUS, STATUS_C_ENTRY);
    result_write(RES_N_ITER, (uint32_t)N_ITER);
    result_write(RES_MISA_LO, read_misa_lo());
    result_write(RES_MISA_HI, read_misa_hi());
    result_write(RES_MARCHID, read_marchid());
    result_write(RES_MIMPID, read_mimpid());
    result_write(RES_MHARTID, read_mhartid());

    mmio_write(STATUS_C_ENTRY);
    mmio_write(RESULTS[RES_MARCHID]);

    mmio_write(0xD0000001);
#ifdef VERILATOR_RUN
    sim_puts("[benchmark] dependent test...\n");
#endif
    fence_io();
    c0 = rdcycle32();
    i0 = rdinstret32();
    dep_checksum = bench_dependent((uint32_t)N_ITER);
    i1 = rdinstret32();
    c1 = rdcycle32();
    fence_io();

    dep_cycles = c1 - c0;
    dep_insts  = i1 - i0;
    dep_ipc    = calc_ipc_x1000_safe(dep_insts, dep_cycles);
    result_write(RES_DEP_CYCLES, dep_cycles);
    result_write(RES_DEP_INSTS, dep_insts);
    result_write(RES_DEP_IPC_X1000, dep_ipc);
    result_write(RES_DEP_CHECKSUM, dep_checksum);
    result_write(RES_STATUS, STATUS_DEP_DONE);

    mmio_write(0xD0000002);
#ifdef VERILATOR_RUN
    sim_puts("[benchmark] ILP test...\n");
#endif
    fence_io();
    c0 = rdcycle32();
    i0 = rdinstret32();
    ilp_checksum = bench_ilp((uint32_t)N_ITER);
    i1 = rdinstret32();
    c1 = rdcycle32();
    fence_io();

    ilp_cycles = c1 - c0;
    ilp_insts  = i1 - i0;
    ilp_ipc    = calc_ipc_x1000_safe(ilp_insts, ilp_cycles);
    result_write(RES_ILP_CYCLES, ilp_cycles);
    result_write(RES_ILP_INSTS, ilp_insts);
    result_write(RES_ILP_IPC_X1000, ilp_ipc);
    result_write(RES_ILP_CHECKSUM, ilp_checksum);
    result_write(RES_STATUS, STATUS_ILP_DONE);

    if (dep_insts != 0u && ilp_cycles != 0u) {
        ratio_x1000 = (uint32_t)(
            ((uint64_t)ilp_insts * dep_cycles * 1000u) /
            ((uint64_t)ilp_cycles * dep_insts)
        );
    } else {
        ratio_x1000 = 0u;
    }
    result_write(RES_RATIO_X1000, ratio_x1000);

    mmio_write(0xD0000003);
#ifdef VERILATOR_RUN
    sim_puts("[benchmark] CRC32 test...\n");
#endif
    gen_test_data(crc_buf, CRC_TEST_LEN);
    result_write(RES_CRC_LEN, (uint32_t)CRC_TEST_LEN);
    fence_io();
    c0 = rdcycle32();
    i0 = rdinstret32();
    crc_checksum = bench_crc(crc_buf, CRC_TEST_LEN);
    i1 = rdinstret32();
    c1 = rdcycle32();
    fence_io();

    crc_cycles = c1 - c0;
    crc_insts  = i1 - i0;
    result_write(RES_CRC_CYCLES, crc_cycles);
    result_write(RES_CRC_INSTS, crc_insts);
    result_write(RES_CRC_CHECKSUM, crc_checksum);
    result_write(RES_STATUS, STATUS_CRC_DONE);

    mmio_write(0xD0000004);
#ifdef VERILATOR_RUN
    sim_puts("[benchmark] matrix test...\n");
#endif
    init_mats();
    result_write(RES_MAT_DIM, MAT_DIM);
    result_write(RES_MAT_REPS, MAT_REPS);
    fence_io();
    c0 = rdcycle32();
    i0 = rdinstret32();
    mat_checksum = bench_matmul(MAT_REPS);
    i1 = rdinstret32();
    c1 = rdcycle32();
    fence_io();

    mat_cycles = c1 - c0;
    mat_insts  = i1 - i0;
    mat_ipc    = calc_ipc_x1000_safe(mat_insts, mat_cycles);
    result_write(RES_MAT_CYCLES, mat_cycles);
    result_write(RES_MAT_INSTS, mat_insts);
    result_write(RES_MAT_IPC_X1000, mat_ipc);
    result_write(RES_MAT_CHECKSUM, mat_checksum);
    result_write(RES_STATUS, STATUS_MAT_DONE);

    result_write(RES_FINAL_MARKER, STATUS_DONE);
    result_write(RES_STATUS, STATUS_DONE);

    mmio_write(STATUS_DONE);

#ifdef VERILATOR_RUN
    sim_puts("\n=== ");
    sim_puts(get_march(RESULTS[RES_MARCHID]));
    sim_puts(" benchmark results ===\n");

    sim_puts("Core type             : ");
    sim_puts(get_march(RESULTS[RES_MARCHID]));
    sim_putchar('\n');

    sim_puts("Hart ID               : ");
    sim_print_u32(RESULTS[RES_MHARTID]);
    sim_putchar('\n');

    sim_puts("misa                  : ");
    sim_print_hex32(RESULTS[RES_MISA_HI]);
    sim_putchar('_');
    sim_print_hex32(RESULTS[RES_MISA_LO]);
    sim_putchar('\n');

    sim_puts("marchid               : ");
    sim_print_hex32(RESULTS[RES_MARCHID]);
    sim_putchar('\n');

    sim_puts("mimpid                : ");
    sim_print_hex32(RESULTS[RES_MIMPID]);
    sim_putchar('\n');

    sim_puts("status                : ");
    sim_print_hex32(RESULTS[RES_STATUS]);
    sim_putchar('\n');

    sim_puts("final                 : ");
    sim_print_hex32(RESULTS[RES_FINAL_MARKER]);
    sim_putchar('\n');

    sim_puts("\nDependent:\n");
    sim_puts("  cycles              : ");
    sim_print_u32(dep_cycles);
    sim_puts("\n  insts               : ");
    sim_print_u32(dep_insts);
    sim_puts("\n  IPC x1000           : ");
    sim_print_u32(dep_ipc);
    sim_puts("\n  checksum            : ");
    sim_print_hex32(dep_checksum);
    sim_putchar('\n');

    sim_puts("\nILP:\n");
    sim_puts("  cycles              : ");
    sim_print_u32(ilp_cycles);
    sim_puts("\n  insts               : ");
    sim_print_u32(ilp_insts);
    sim_puts("\n  IPC x1000           : ");
    sim_print_u32(ilp_ipc);
    sim_puts("\n  checksum            : ");
    sim_print_hex32(ilp_checksum);
    sim_puts("\n  ratio x1000         : ");
    sim_print_u32(ratio_x1000);
    sim_putchar('\n');

    sim_puts("\nCRC32:\n");
    sim_puts("  cycles              : ");
    sim_print_u32(crc_cycles);
    sim_puts("\n  insts               : ");
    sim_print_u32(crc_insts);
    sim_puts("\n  checksum            : ");
    sim_print_hex32(crc_checksum);
    sim_putchar('\n');

    sim_puts("\nMatrix:\n");
    sim_puts("  dimension           : ");
    sim_print_u32(MAT_DIM);
    sim_puts("\n  repetitions         : ");
    sim_print_u32(MAT_REPS);
    sim_puts("\n  cycles              : ");
    sim_print_u32(mat_cycles);
    sim_puts("\n  insts               : ");
    sim_print_u32(mat_insts);
    sim_puts("\n  IPC x1000           : ");
    sim_print_u32(mat_ipc);
    sim_puts("\n  checksum            : ");
    sim_print_hex32(mat_checksum);
    sim_puts("\n\nBenchmark complete.\n");

    /* Wait outside measured regions for UART serialization to finish. */
    delay_small(1000000);

    sim_exit_success();
#else
    while (1) {
        mmio_write(RESULTS[RES_MARCHID]);
        mmio_write(mat_ipc);
        mmio_write(mat_checksum);
        mmio_write(STATUS_DONE);
        delay_small(500000);
    }
#endif

    return 0;
}

#else

#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/mman.h>

#define RESULT_BASE_MMIO_PHYS   0xB0010000UL
#define RESULT_MAP_SIZE         0x1000UL

int main(void)
{
    int fd = open("/dev/mem", O_RDWR | O_SYNC);
    if (fd < 0) {
        perror("open(/dev/mem)");
        return 1;
    }

    volatile uint32_t *m = (volatile uint32_t *)mmap(
        NULL, RESULT_MAP_SIZE, PROT_READ | PROT_WRITE, MAP_SHARED,
        fd, RESULT_BASE_MMIO_PHYS);

    if (m == MAP_FAILED) {
        perror("mmap");
        close(fd);
        return 1;
    }

    while (m[RES_FINAL_MARKER] != STATUS_DONE) {
        if (m[RES_STATUS] == STATUS_TRAP) {
            printf("TRAP: mcause=0x%08x mepc=0x%08x mtval=0x%08x\n",
                   m[RES_TRAP_MCAUSE], m[RES_TRAP_MEPC], m[RES_TRAP_MTVAL]);
            munmap((void *)m, RESULT_MAP_SIZE);
            close(fd);
            return 1;
        }
        usleep(1000);
    }

    uint8_t crc_buf_ps[CRC_TEST_LEN];
    gen_test_data(crc_buf_ps, CRC_TEST_LEN);
    uint32_t ps_crc = crc32_compute(crc_buf_ps, CRC_TEST_LEN);

    printf("Core type    : %s\n", get_march(m[RES_MARCHID]));
    printf("Hart ID      : %u\n", m[RES_MHARTID]);
    printf("misa         : 0x%08x_%08x\n", m[RES_MISA_HI], m[RES_MISA_LO]);
    printf("marchid      : 0x%08x\n", m[RES_MARCHID]);
    printf("mimpid       : 0x%08x\n", m[RES_MIMPID]);
    printf("status       : 0x%08x\n", m[RES_STATUS]);
    printf("final        : 0x%08x\n", m[RES_FINAL_MARKER]);

    printf("\nDependent:\n");
    printf("  cycles     : %u\n", m[RES_DEP_CYCLES]);
    printf("  insts      : %u\n", m[RES_DEP_INSTS]);
    printf("  IPC x1000  : %u\n", m[RES_DEP_IPC_X1000]);
    printf("  checksum   : 0x%08x\n", m[RES_DEP_CHECKSUM]);

    printf("\nILP:\n");
    printf("  cycles     : %u\n", m[RES_ILP_CYCLES]);
    printf("  insts      : %u\n", m[RES_ILP_INSTS]);
    printf("  IPC x1000  : %u\n", m[RES_ILP_IPC_X1000]);
    printf("  checksum   : 0x%08x\n", m[RES_ILP_CHECKSUM]);
    printf("  ratio x1000: %u\n", m[RES_RATIO_X1000]);

    printf("\nCRC32:\n");
    printf("  core CRC   : 0x%08x\n", m[RES_CRC_CHECKSUM]);
    printf("  PS CRC     : 0x%08x\n", ps_crc);
    printf("  result     : %s\n", (ps_crc == m[RES_CRC_CHECKSUM]) ? "PASS" : "FAIL");

    printf("\nMatrix %ux%u, reps=%u:\n",
           m[RES_MAT_DIM], m[RES_MAT_DIM], m[RES_MAT_REPS]);
    printf("  cycles     : %u\n", m[RES_MAT_CYCLES]);
    printf("  insts      : %u\n", m[RES_MAT_INSTS]);
    printf("  IPC x1000  : %u\n", m[RES_MAT_IPC_X1000]);
    printf("  checksum   : 0x%08x\n", m[RES_MAT_CHECKSUM]);

    printf("\nTrap regs:\n");
    printf("  mcause     : 0x%08x\n", m[RES_TRAP_MCAUSE]);
    printf("  mepc       : 0x%08x\n", m[RES_TRAP_MEPC]);
    printf("  mtval      : 0x%08x\n", m[RES_TRAP_MTVAL]);

    munmap((void *)m, RESULT_MAP_SIZE);
    close(fd);
    return 0;
}

#endif
