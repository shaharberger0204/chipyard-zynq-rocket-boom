# Source manifest

## User-supplied final files

- `hardware/chipyard_scala/zynq7cg/*.scala` — from the supplied **SCALA FINAL** archive.
- `hardware/generated_rtl/boom/` — from the supplied **BOOM_FILES** archive, excluding four unrelated report/helper files accidentally mixed into that folder.
- `software/benchmark/benchmark.c` — supplied final unified benchmark source.
- `software/benchmark/bin/benchmark_fpga.riscv` — supplied final FPGA RISC-V ELF.
- `docs/project_report/Chipyard_project_book_final.docx` — supplied final report.
- `docs/presentation/Chipyard_Project_Presentation_final.pptx` — supplied final presentation.

## Recovered from supplied interrupted Vivado archive downloads

The two `.crdownload` files were incomplete ZIP downloads and did not contain a central directory. Complete individual ZIP entries that had already finished downloading were recoverable and validated at the deflate-stream level.

Recovered clean source material includes:

- Rocket `.xpr`, `.srcs`, constraints/custom RTL, `psu_init.tcl`, `system.xsa`, and final `system.bit`.
- BOOM `.xpr`, `.srcs`, constraints/custom RTL, `psu_init.tcl`, `system.xsa`, and final `system.bit`.

Vivado cache/run/generated directories were intentionally not included in this final archive.

## Derived archive files

- `docs/diagrams/*.png` — figures extracted losslessly from the final report.
- `simulation/results/*.png` and `results/hardware/*.png` — final execution captures extracted losslessly from the final report.
- `software/benchmark/bin/benchmark_fpga.bin` — flat binary extracted from the supplied ELF LOAD segment.
- `results/final_results.csv` and timing CSV — transcribed from the final captured/report values.

## Reproducibility helpers added for the archive

The following small files were added to make the archive easier to reuse; they were not separately supplied as original project files:

- `software/benchmark/marchid.h`
- `software/benchmark/linker.ld`
- `software/benchmark/Makefile`
- `software/tools/bin_to_devmem.py`

The supplied `benchmark_fpga.riscv` remains the reference final FPGA executable.
