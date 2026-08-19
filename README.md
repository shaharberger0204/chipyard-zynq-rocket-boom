# Chipyard Rocket & BOOM on iW-RainboW-G30M

Final-project repository for integrating Chipyard-generated RISC-V processors with the iW-RainboW-G30M Zynq UltraScale+ MPSoC platform.

The project implements and evaluates two RISC-V cores in the Programmable Logic (PL):

- **Rocket** — in-order core
- **BOOM / SonicBOOM** — out-of-order core

Both cores were generated with Chipyard, adapted to the target Zynq platform with board-specific Scala, packaged as custom Vivado IP, connected to DDR and PL peripherals through AXI, and successfully executed on the physical FPGA platform.

## Project information

- Project: **Chipyard on iW-RainboW-G30M**
- Project number: **3340**
- Students: **Asaf Alber** and **Shahar Berger**
- Supervisor: **Baruch Kagan**
- Target FPGA part: `xczu7cg-fbvb900-1-i`
- FPGA tools: Vivado / PetaLinux 2023.2 project flow
- RISC-V framework: Chipyard
- Hardware cores: Rocket and BOOM
- RISC-V execution model: bare-metal code running from shared DDR

## Final architecture

The Zynq Processing System (PS) runs ARM/Linux. The selected Chipyard core is implemented in the PL.

### Memory path

`RISC-V M_AXI_MEM -> 64-bit address remap -> Zynq S_AXI_HP1_FPD -> DDR`

The RISC-V executable is linked to execute from the Chipyard-visible DDR window beginning at `0x80000000`. The Zynq-side memory mapping/remap logic allows ARM/Linux to preload the same physical DDR contents before the RISC-V core starts.

### MMIO path

`RISC-V M_AXI_MMIO -> AXI interconnect -> PL peripherals / result region`

The MMIO path is used for status, benchmark results, GPIO/BRAM communication, and debugging-visible control/status resources.

### Reset control — final implementation

During hardware validation, **the RISC-V reset is held and released using a VIO-controlled signal combined with the active-low system reset path**. ARM/Linux does not directly release the RISC-V reset through the benchmark MMIO mailbox.

The runtime order is:

1. Boot the Zynq PS and Linux.
2. Configure the PL.
3. Keep the RISC-V core in reset.
4. Load the RISC-V executable/data into DDR from ARM/Linux.
5. Release the RISC-V core through the VIO + system-reset logic.
6. Execute the benchmark.
7. Read completion, trap status, CRC32, and performance results through the defined memory/MMIO interfaces.

## Final board-specific Chipyard files

The authoritative final Scala target is under:

`hardware/chipyard_scala/zynq7cg/`

| File | Purpose |
|---|---|
| `Configs.scala` | Defines the final Rocket, BOOM, and Verilator configurations and the shared Zynq adaptations. |
| `HarnessBinders.scala` | Exposes AXI memory/MMIO ports and binds clock/reset and other harness ports. |
| `TestHarness.scala` | Defines `Zynq7CGHarness`, the 100 MHz reference clock, and generated Chipyard system instantiation. |
| `Zynq7CGShell.scala` | Defines the external 100 MHz clock and active-low reset interface used for Vivado IP packaging. |

Final hardware configurations:

- `SmallRocketZynq7CGConfig`
- `TinyBoomZynq7CGConfig`

Final simulation configurations:

- `TinyRocketVerilatorConfig`
- `TinyBoomVerilatorConfig`

Example hardware-generation commands used by the project flow:

```bash
make SUB_PROJECT=zynq7cg CONFIG=SmallRocketZynq7CGConfig verilog
make SUB_PROJECT=zynq7cg CONFIG=TinyBoomZynq7CGConfig verilog
```

## Unified benchmark

The same `software/benchmark/benchmark.c` source supports:

- FPGA bare-metal execution on the RISC-V core,
- Verilator execution when compiled with `VERILATOR_RUN`, and
- ARM/Linux result checking when compiled natively on the PS.

Workloads:

1. Dependent instruction chain
2. Instruction-level-parallelism (ILP) loop
3. CRC32 over a deterministic 256-byte data set
4. Repeated 8x8 matrix multiplication

Performance counters:

- `mcycle`
- `minstret`

IPC is calculated as:

`IPC = retired instructions / cycles`

The benchmark also records core identification, completion state, trap registers, workload checksums, CRC32, and a final completion marker.

## Final captured performance results

The values below are transcribed from the final execution captures stored in this repository.

| Workload | Metric | Rocket Sim | Rocket HW | BOOM Sim | BOOM HW |
|---|---:|---:|---:|---:|---:|
| Dependent | Cycles | 2,100,072 | 2,100,178 | 1,800,149 | 1,800,188 |
| Dependent | IPC | 0.857 | 0.857 | 0.999 | 0.999 |
| ILP | Cycles | 1,300,074 | 1,300,068 | 1,000,161 | 1,000,131 |
| ILP | IPC | 0.769 | 0.769 | 0.999 | 0.999 |
| Matrix | Cycles | 39,503,006 | 39,503,151 | 6,995,257 | 6,995,224 |
| Matrix | IPC | 0.176 | 0.176 | 0.999 | 0.999 |
| CRC32 | Result | `0x7F7E1AF9` | `0x7F7E1AF9` | `0x7F7E1AF9` | `0x7F7E1AF9` |
| Functional validation | Result | PASS | PASS | PASS | PASS |

The simulation and FPGA measurements are very close for each processor. For the tested configurations, BOOM required approximately 14% fewer cycles in the dependent-chain workload, 23% fewer cycles in the ILP workload, and about 82% fewer cycles in matrix multiplication. Rocket required approximately 5.65 times as many matrix-multiplication cycles as BOOM.

## BOOM post-route timing

| Frequency | WNS | TNS | WHS | THS | Result |
|---:|---:|---:|---:|---:|---|
| 100.00 MHz | +0.321 ns | 0 ns | +0.010 ns | 0 ns | PASS |
| 107.15 MHz | +0.187 ns | 0 ns | +0.009 ns | 0 ns | PASS |
| 115.38 MHz | -0.174 ns | -2.601 ns | +0.002 ns | 0 ns | Setup fail |

Therefore, **107.15 MHz is the highest tested passing BOOM frequency** in the final timing sweep. It is the highest validated tested point, not a mathematical statement of the absolute maximum achievable frequency.

## Repository structure

```text
.
├── README.md
├── hardware/
│   ├── chipyard_scala/zynq7cg/
│   ├── generated_rtl/boom/
│   ├── vivado/rocket/
│   ├── vivado/boom/
│   └── bitstreams/{rocket,boom}/
├── software/
│   ├── benchmark/
│   └── tools/
├── simulation/
│   └── results/
├── results/
│   ├── hardware/
│   ├── simulation/
│   └── timing/
└── docs/
    ├── diagrams/
    ├── project_report/
    └── presentation/
```

The existing repository already contains Rocket generated RTL and other previously uploaded hardware material. This final update adds/replaces the authoritative final sources and evidence without intentionally committing Vivado cache/run directories.

## Vivado source policy

The repository keeps project/source material needed to understand and reproduce the design while excluding generated build directories where possible.

Do not commit regenerated directories such as:

```text
.Xil/
*.cache/
*.runs/
*.sim/
*.tmp/
*.hw/
*.ip_user_files/
```

The clean source snapshots included here preserve `.xpr`, `.srcs`, constraints, custom RTL, exported XSA/platform files, and final bitstreams recovered from the supplied project archives.

## Documentation

- Final report: `docs/project_report/Chipyard_project_book_final.docx`
- Final presentation: `docs/presentation/Chipyard_Project_Presentation_final.pptx`
- Architecture/workflow figures: `docs/diagrams/`
- Final simulation captures: `simulation/results/`
- Final hardware captures: `results/hardware/`
- Timing table: `results/timing/boom_post_route_timing.csv`

## Final project status

- Rocket generated and integrated: **complete**
- BOOM generated and integrated: **complete**
- Rocket bare-metal hardware execution: **PASS**
- BOOM bare-metal hardware execution: **PASS**
- Rocket Verilator benchmark: **PASS**
- BOOM Verilator benchmark: **PASS**
- CRC32 validation: **PASS on all final runs**
- Final comparative benchmark: **complete**
- BOOM post-route timing sweep: **complete**

## Future work

Possible extensions include a single design containing both processors, Dynamic Function eXchange (DFX) between Rocket and BOOM, additional cache/processor configurations, further AXI/memory optimization, and more automated load/run/result collection.
