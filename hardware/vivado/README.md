# Vivado source snapshots

The Rocket and BOOM folders contain clean source snapshots recovered from complete entries inside the supplied interrupted Vivado ZIP downloads.

Included where available:

- `.xpr` project file
- `.srcs` source tree
- block design (`design_1.bd`)
- constraints and custom RTL such as `axi_addr_remap_64.v`
- `psu_init.tcl`
- exported `system.xsa`

Generated caches/runs/IP-user-files are intentionally omitted. Final bitstreams are stored separately under `hardware/bitstreams/`.
