# Unified benchmark

`benchmark.c` is the final unified benchmark source.

It supports three build modes:

1. **RISC-V FPGA** — default RISC-V build; results are written to the physical MMIO mailbox.
2. **RISC-V Verilator** — compile with `-DVERILATOR_RUN`; results are stored in simulation memory, printed through the simulated UART, and completion is signaled through `tohost`.
3. **ARM/Linux checker** — compile the same source natively on the PS; the non-RISC-V path maps the result mailbox through `/dev/mem`, waits for completion, and validates CRC32.

The supplied final FPGA ELF is in `bin/benchmark_fpga.riscv`. Its entry point is `0x80000000`. A raw binary extracted from the ELF load segment is included as `bin/benchmark_fpga.bin`.

`Makefile`, `linker.ld`, and `marchid.h` are repository reproducibility helpers packaged with the final archive. The supplied FPGA ELF remains the reference executable that was provided with the final project files.
