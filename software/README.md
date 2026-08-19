# Software flow

The final runtime flow uses ARM/Linux as the host environment and a bare-metal RISC-V benchmark in the PL.

- RISC-V logical execution base: `0x80000000`
- ARM/Linux physical preload region documented by the project: `0x40000000`
- RISC-V result/MMIO base: `0x60010000`
- ARM/Linux PS-visible result mapping used by the checker: `0xB0010000`

The address-remapping hardware bridges the Chipyard-visible and Zynq physical address spaces.

Reset release is performed through VIO combined with the system reset path, not by a benchmark mailbox write.
