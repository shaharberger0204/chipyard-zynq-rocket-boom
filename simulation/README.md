# Chipyard Verilator simulation

Final simulation configurations are defined in `hardware/chipyard_scala/zynq7cg/Configs.scala`:

- `TinyRocketVerilatorConfig`
- `TinyBoomVerilatorConfig`

The final benchmark source is `software/benchmark/benchmark.c`. Build the simulation version with `VERILATOR_RUN` (the provided Makefile creates `benchmark_verilator.riscv`) and run it with the corresponding Chipyard Verilator configuration.

Representative Chipyard invocation pattern:

```bash
cd <chipyard>/sims/verilator
make CONFIG=TinyRocketVerilatorConfig BINARY=<path>/benchmark_verilator.riscv LOADMEM=1 run-binary
make CONFIG=TinyBoomVerilatorConfig   BINARY=<path>/benchmark_verilator.riscv LOADMEM=1 run-binary
```

The final captured outputs are stored in `simulation/results/`.
