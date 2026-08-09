# Chipyard Rocket & BOOM on iW-RainboW-G30M

Final project repository for integrating **Chipyard-generated RISC-V processors** with the **iW-RainboW-G30M Zynq UltraScale+ MPSoC platform**.

The project implements two different RISC-V cores in the Programmable Logic (PL):

- **Rocket** — in-order RISC-V core
- **BOOM** — out-of-order RISC-V core

Both cores were generated using Chipyard, adapted to the target board with custom Scala files, packaged as Vivado IP, integrated with the Zynq Processing System (PS), and successfully executed on the physical FPGA platform.

The project also compares Rocket and BOOM using the same benchmark in both **RTL simulation** and **hardware execution**.

---

## Project Information

- **Project:** Chipyard on iW-RainboW-G30M
- **Project number:** 3340
- **Target board:** iW-RainboW-G30M
- **FPGA device:** Xilinx Zynq UltraScale+ MPSoC
- **Vivado part:** `xczu7cg-fbvb900-1-i`
- **RISC-V framework:** Chipyard
- **Processor cores:** Rocket and BOOM
- **Host/Control processor:** ARM Processing System running Linux
- **RISC-V execution model:** bare-metal software running on the selected RISC-V core in the PL

---

# 1. Project Overview

The goal of this project was to create a complete flow for deploying configurable Chipyard processors on a Zynq-based FPGA platform that is not included as a standard Chipyard FPGA target.

The final flow includes:

1. Selecting and configuring a Rocket or BOOM processor in Chipyard.
2. Applying board-specific Scala adaptations.
3. Generating synthesizable Verilog/SystemVerilog RTL.
4. Packaging the generated RISC-V processor as a custom Vivado IP.
5. Integrating the IP into the Zynq block design.
6. Connecting the processor to DDR memory and MMIO peripherals through AXI.
7. Booting Linux on the ARM Processing System from an SD card.
8. Loading a RISC-V bare-metal executable into memory.
9. Releasing the RISC-V core from reset.
10. Executing the benchmark.
11. Reading status and benchmark results back from the ARM/Linux side.
12. Comparing Rocket and BOOM in simulation and on the physical FPGA.

The same surrounding Zynq/Vivado architecture is used for both processors. The selected RISC-V processor IP is replaced between the Rocket and BOOM implementations.

---

# 2. Main Achievements

The final system successfully demonstrates:

- Chipyard-to-Vivado integration for a custom Zynq UltraScale+ platform.
- Board-specific Chipyard support implemented in Scala.
- Successful Rocket execution on the physical FPGA.
- Successful BOOM execution on the physical FPGA.
- AXI-based DDR access from the RISC-V processor.
- MMIO communication between the RISC-V processor and FPGA peripherals.
- Linux-based control from the ARM Processing System.
- GPIO-based functional validation.
- CRC32 functional validation against an independently calculated ARM/Linux reference.
- Performance measurement using `mcycle` and `minstret`.
- RTL simulation of the same benchmark used on hardware.
- Direct Rocket-versus-BOOM performance comparison.
- Very close agreement between simulation and physical FPGA measurements.

---

# 3. System Architecture

The system is divided between the Zynq **Processing System (PS)** and **Programmable Logic (PL)**.

## Processing System

The ARM-based PS runs Linux and is responsible for:

- booting the board,
- configuring the PL,
- loading executable code into memory,
- controlling the RISC-V reset/runtime state,
- reading memory-mapped status values,
- reading benchmark results,
- assisting with debugging and validation.

## Programmable Logic

The PL contains the selected Chipyard-generated processor:

- Rocket, or
- BOOM.

The PL also contains the supporting AXI infrastructure and peripherals used by the project.

The processor exposes separate AXI interfaces for:

- memory traffic,
- MMIO traffic.

The processor memory path is connected through a custom address-remapping block to the Zynq PS high-performance interface:

`M_AXI_MEM -> address remap -> S_AXI_HP1_FPD`

This allows the RISC-V core to access executable code and data stored in system DDR memory.

The MMIO path is connected to the AXI infrastructure used for control and result communication.

Additional blocks used in the final Vivado design include:

- AXI Interconnect / SmartConnect infrastructure,
- AXI GPIO,
- custom pulse-generation logic,
- AXI BRAM controllers,
- block memory,
- reset and clock logic,
- VIO,
- ILA.

---

# 4. Boot and Runtime Flow

The final system uses the **SD card as the main boot path**.

A high-level runtime flow is:

```text
Host PC
   |
   +--> Vivado hardware platform
   |
   +--> PetaLinux boot files
   |
   +--> RISC-V benchmark executable
                |
                v
             SD Card
                |
                v
        ZynqMP FPGA Board
        PS Linux + PL configured
                |
                v
         Linux on ARM
                |
                v
       Load Rocket/BOOM code
                |
                v
       Control reset / status
                |
                v
      RISC-V executes benchmark
                |
                v
        Read result region
```

### JTAG

JTAG is used as a **debugging path**, including Vivado Hardware Manager / ILA / VIO access.

It is not the primary final boot path.

---

# 5. Chipyard Board-Specific Adaptations

The target board is not a predefined Chipyard FPGA platform, so dedicated Scala support was created.

The main board-specific files are:

| File | Purpose |
|---|---|
| `Configs.scala` | Defines the board-specific Rocket and BOOM configurations and applies the Zynq-specific adaptations. |
| `HarnessBinders.scala` | Exposes the AXI memory and MMIO interfaces and connects the generated Chipyard system to the top-level harness. |
| `IOBinders.scala` | Contains custom debug/reset I/O binding support. |
| `TestHarness.scala` | Defines the Zynq harness, reference clock, reset conversion, and generated Chipyard system instance. |
| `Zynq7CGShell.scala` | Defines the clean top-level FPGA shell used for Vivado IP packaging. |

The project contains separate working Scala configurations for Rocket and BOOM while reusing the same general board-specific infrastructure.

---

# 6. Processor Configurations

## Rocket

The Rocket implementation is based on the board-specific Rocket configuration and uses the same Zynq integration infrastructure described above.

Rocket is an **in-order** processor. Instructions are generally issued and executed in program order.

## BOOM

The BOOM implementation uses the board-specific BOOM configuration and the same external platform interfaces.

BOOM is an **out-of-order** processor and can exploit instruction-level parallelism when independent instructions are available.

---

# 7. Vivado Integration

After Chipyard generates RTL, the processor is packaged as a custom Vivado IP and integrated into the Zynq block design.

The final Rocket and BOOM implementations use the same general hardware architecture.

Important project elements include:

- custom Rocket or BOOM processor IP,
- `M_AXI_MEM`,
- `M_AXI_MMIO`,
- custom 64-bit AXI address remapping,
- Zynq PS `S_AXI_HP1_FPD`,
- AXI GPIO,
- BRAM,
- pulse-generation/control logic,
- ILA/VIO debugging,
- board clock/reset infrastructure.

The BOOM Vivado sources in this repository are derived from the final design containing the BOOM processor IP, block design, constraints, custom RTL, and platform files required for the implemented system.

Generated Vivado build products such as implementation runs, cache directories, temporary files, and logs are intentionally excluded where possible.

---

# 8. Benchmark

A single unified benchmark was used for both Rocket and BOOM.

The benchmark contains four workloads.

## 8.1 Dependent-Chain Test

A sequence of arithmetic operations with sequential data dependencies.

This workload provides relatively little opportunity for instruction overlap.

## 8.2 Instruction-Level Parallelism Test

Several independent registers are updated inside the same loop.

This workload provides more independent operations that an out-of-order processor can exploit.

## 8.3 CRC32 Test

A deterministic 256-byte data sequence is processed using CRC32.

The CRC32 result is used primarily as a functional validation check.

Expected/reference result:

```text
0x7F7E1AF9
```

## 8.4 Matrix Multiplication

Repeated `8 x 8` matrix multiplication is used as the larger computational workload.

The workload includes multiplication, accumulation, memory accesses, and multiple independent operations.

---

# 9. Performance Measurement

The benchmark reads the standard RISC-V performance counters:

- `mcycle`
- `minstret`

These values are used to calculate IPC:

```text
IPC = retired instructions / cycles
```

The benchmark also records:

- processor identification,
- completion status,
- workload checksums,
- CRC32 result,
- trap/completion information.

---

# 10. Final Simulation Results

The same benchmark was executed separately on Rocket and BOOM in RTL simulation.

| Parameter | Rocket | BOOM |
|---|---:|---:|
| Dependent-chain cycles | 2,100,072 | 1,800,149 |
| Dependent-chain IPC | 0.857 | 0.999 |
| ILP cycles | 1,300,074 | 1,000,161 |
| ILP IPC | 0.769 | 0.999 |
| CRC32 cycles | 24,082 | 17,795 |
| CRC32 result | `0x7F7E1AF9` | `0x7F7E1AF9` |
| Matrix cycles | 39,503,006 | 6,995,257 |
| Matrix IPC | 0.176 | 0.999 |
| Matrix checksum | `0x53846D4F` | `0x53846D4F` |
| Completion | PASS | PASS |

Both simulations completed normally.

The corresponding workload checksums matched between Rocket and BOOM.

---

# 11. Final Hardware Results

The same benchmark was executed on both processor implementations on the physical FPGA platform.

| Parameter | Rocket Hardware | BOOM Hardware |
|---|---:|---:|
| Dependent-chain cycles | 2,100,137 | 1,800,188 |
| Dependent-chain IPC | 0.856 | 0.999 |
| ILP cycles | 1,300,068 | 1,000,137 |
| ILP IPC | 0.768 | 0.999 |
| CRC32 validation | PASS | PASS |
| Matrix cycles | 39,503,174 | 6,995,276 |
| Matrix IPC | 0.176 | 0.999 |
| Final status | DONE / No trap | DONE / No trap |

CRC32 result on both cores:

```text
0x7F7E1AF9
```

---

# 12. Rocket vs BOOM

BOOM required fewer cycles than Rocket in all measured workloads.

### Dependent chain

BOOM required approximately **14% fewer cycles**.

### ILP workload

BOOM required approximately **23% fewer cycles**.

### Matrix multiplication

This workload produced the largest performance difference.

Rocket:

```text
~39.5 million cycles
```

BOOM:

```text
~7.0 million cycles
```

Rocket therefore required approximately **5.65 times as many cycles** as BOOM for the matrix workload.

The matching checksums confirm that both processors completed the same functional workload.

---

# 13. Simulation vs Hardware

One of the strongest results of the project is the very close agreement between RTL simulation and FPGA execution.

Examples:

| Core / Workload | Simulation | Hardware |
|---|---:|---:|
| Rocket dependent | 2,100,072 | 2,100,137 |
| BOOM dependent | 1,800,149 | 1,800,188 |
| Rocket ILP | 1,300,074 | 1,300,068 |
| BOOM ILP | 1,000,161 | 1,000,137 |
| Rocket matrix | 39,503,006 | 39,503,174 |
| BOOM matrix | 6,995,257 | 6,995,276 |

The close correspondence strengthens confidence that the simulation captures the relative performance behavior observed on the physical FPGA platform.

---

# 14. Repository Structure

The repository is organized so that source files are separated from generated build artifacts.

A recommended structure is:

```text
.
├── README.md
│
├── hardware/
│   ├── chipyard_scala/
│   │   ├── common/
│   │   ├── rocket/
│   │   └── boom/
│   │
│   ├── generated_rtl/
│   │   ├── rocket/
│   │   └── boom/
│   │
│   └── vivado/
│       ├── rocket/
│       └── boom/
│
├── software/
│   ├── benchmark/
│   └── arm_linux_checker/
│
├── simulation/
│   ├── rocket/
│   ├── boom/
│   └── results/
│
├── results/
│   ├── hardware/
│   └── simulation/
│
└── docs/
    ├── diagrams/
    └── project_report/
```

The exact folder structure may evolve as the remaining software and result files are added.

---

# 15. Current Repository Status

The current repository snapshot focuses mainly on the completed hardware integration.

Currently available material includes:

- Rocket board-specific Scala files,
- BOOM board-specific Scala files,
- general Rocket/BOOM configuration files,
- Rocket generated RTL,
- BOOM generated RTL,
- Rocket Vivado project/source material,
- BOOM Vivado project/source material,
- custom address-remapping logic,
- Vivado block design sources,
- constraints and debugging support,
- platform files such as the XSA and PS initialization data.

The following items may be added in a later repository update:

- unified benchmark source,
- ARM/Linux checker source,
- final simulation scripts,
- raw simulation outputs,
- raw hardware outputs,
- screenshots,
- final project report and supporting documentation.

This README already documents the completed benchmark methodology and final numerical results so the project status is clear even before those files are added.

---

# 16. Building the Chipyard Hardware

The high-level Chipyard generation process is:

```text
Chipyard configuration
        |
        v
Board-specific Scala target
        |
        v
Chipyard hardware generation
        |
        v
Generated Verilog/SystemVerilog
        |
        v
Custom Vivado IP
```

The exact Chipyard checkout, environment setup, and build commands should match the version used for the project.

The repository contains the board-specific Scala sources needed to understand and reproduce the custom target.

---

# 17. Vivado Build Notes

For a clean repository, the important Vivado sources are maintained while large automatically generated directories are excluded.

Typical generated directories that should not be committed include:

```text
.Xil/
*.cache/
*.runs/
*.sim/
*.tmp/
*.hw/
*.ip_user_files/
```

Typical log/journal files that should also be excluded include:

```text
vivado.log
vivado.jou
*.backup.log
*.backup.jou
hs_err_*.log
```

These files can be regenerated by Vivado and are not required as project source.

---

# 18. Debugging

Several methods were used during hardware bring-up and validation.

## UART / Serial Console

Tera Term was used to access the Linux console over UART.

## Linux `devmem`

During bring-up and debugging, `devmem` was used to read and write physical addresses in order to verify:

- memory mapping,
- MMIO registers,
- control/status regions,
- communication between PS and PL.

The final benchmark flow uses a dedicated ARM/Linux checker instead of relying only on manual `devmem` access.

## JTAG / Vivado Hardware Manager

JTAG is used as an auxiliary debugging path.

Vivado Hardware Manager together with ILA/VIO allows internal signals and AXI activity to be observed during hardware execution.

JTAG is not the primary final boot mechanism.

---

# 19. Functional Validation

A benchmark run is considered valid when:

1. the expected processor identification is reported,
2. the benchmark reaches the completion marker,
3. no fatal trap is detected,
4. workload checksums match,
5. the CRC32 result matches the ARM/Linux reference.

Reference CRC32:

```text
0x7F7E1AF9
```

---

# 20. Future Work

Possible extensions include:

- integrating Rocket and BOOM into a single FPGA design,
- Dynamic Function eXchange (DFX) between Rocket and BOOM,
- evaluating additional processor/cache configurations,
- investigating different AXI or memory configurations,
- testing higher operating frequencies,
- adding more workloads,
- automating the complete load/run/result collection flow,
- expanding simulation and hardware regression testing.

A DFX-based design could keep the PS, AXI, memory, clock, reset, and control infrastructure static while replacing only the active RISC-V core.

---

# 21. Notes

This repository documents a research/academic FPGA integration flow rather than a standalone commercial IP product.

Some generated RTL and Vivado files can be large. The repository therefore prioritizes the source files required to understand and reproduce the design while avoiding unnecessary generated build artifacts.

---

# 22. References

Useful external references:

- Chipyard documentation
- Chipyard community / Google Group
- AMD Vivado IP Integrator documentation
- AMD Vivado custom IP packaging documentation
- AMD AXI documentation
- iWave iW-RainboW-G30M / Zynq UltraScale+ platform documentation

---

## Repository Update Note

The project is complete on both Rocket and BOOM hardware.  
The repository is being reorganized into a clean final-project archive.

Additional software, benchmark, simulation, and raw-result files can be added later without changing the overall project structure described above.
