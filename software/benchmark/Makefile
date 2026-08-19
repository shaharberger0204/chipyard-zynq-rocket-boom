RISCV_GCC ?= riscv64-unknown-elf-gcc
RISCV_OBJCOPY ?= riscv64-unknown-elf-objcopy

COMMON_CFLAGS := -O2 -ffreestanding -fno-builtin -fno-pic -mcmodel=medany \
                 -march=rv64ima_zicsr -mabi=lp64 -Wall -Wextra
COMMON_LDFLAGS := -nostdlib -nostartfiles -static -Wl,--build-id=none -T linker.ld

.PHONY: all clean
all: benchmark_fpga.riscv benchmark_verilator.riscv benchmark_fpga.bin

benchmark_fpga.riscv: benchmark.c marchid.h linker.ld
	$(RISCV_GCC) $(COMMON_CFLAGS) $(COMMON_LDFLAGS) benchmark.c -o $@

benchmark_verilator.riscv: benchmark.c marchid.h linker.ld
	$(RISCV_GCC) $(COMMON_CFLAGS) -DVERILATOR_RUN $(COMMON_LDFLAGS) benchmark.c -o $@

benchmark_fpga.bin: benchmark_fpga.riscv
	$(RISCV_OBJCOPY) -O binary $< $@

arm_linux_checker: benchmark.c marchid.h
	$(CC) -O2 -Wall -Wextra benchmark.c -o $@

clean:
	rm -f benchmark_fpga.riscv benchmark_verilator.riscv benchmark_fpga.bin arm_linux_checker
