# Source Manifest

This package was prepared from the project files currently available.

## Included now

### Chipyard / Scala
- General Rocket configuration source
- General BOOM configuration source
- Final working board-specific Scala files for Rocket
- Final working board-specific Scala files for BOOM

### Generated RTL
- Rocket generated Verilog/SystemVerilog package
- BOOM generated Verilog/SystemVerilog package

### Vivado
For both Rocket and BOOM:
- Vivado project file (`.xpr`)
- Final block design and its IP configuration files
- Custom AXI address-remapping RTL
- Pulse generator RTL
- Design wrapper
- Relevant constraints
- XSA platform export
- PS initialization Tcl

The large Vivado implementation/cache/run folders are intentionally not included.

## Important note

The Vivado `srcs` folders supplied with the original project also contain some
legacy/base-board source files. This package keeps the final block-design source
and its IP configuration hierarchy, but intentionally avoids large generated
artifacts such as cached runs and bitstreams.

See `ADD_LATER.md` for software, benchmark, simulation, and raw-result files that
can be committed in a later update.
