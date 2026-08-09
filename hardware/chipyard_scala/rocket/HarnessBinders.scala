package chipyard.fpga.zynq7cg

import chisel3._
import org.chipsalliance.cde.config.Config
import chipyard.harness.{HarnessBinders, HarnessBinderFunction}
import chipyard.iobinders._

class WithCleanZynq7CGHarnessBinders extends Config((site, here, up) => {
  case HarnessBinders =>
    val cleanBinders: HarnessBinderFunction = {
      case (th: Zynq7CGHarness, port: AXI4MemPort, chipId: Int) => {
        // Expose the SoC external memory AXI master to the IP top level.
		// This is the normal external memory path and can be cached by the core.
        val axi_mem = IO(chiselTypeOf(port.io.bits)).suggestName("axi4_mem_0")
        axi_mem <> port.io.bits
      }

      case (th: Zynq7CGHarness, port: AXI4MMIOPort, chipId: Int) => {
        // Expose the SoC external MMIO AXI master to the IP top level.
        // Use this for uncached/device-style accesses instead of M_AXI_MEM.
        val axi_mmio = IO(chiselTypeOf(port.io.bits)).suggestName("axi4_mmio_0")
        axi_mmio <> port.io.bits
      }

      case (th: Zynq7CGHarness, port: ClockPort, chipId: Int) => {
        // Drive ChipTop clock input from our clean 100 MHz top-level clock.
        port.io := th.CLK100MHZ
      }

      case (th: Zynq7CGHarness, port: ResetPort, chipId: Int) => {
        // ck_rst is reset-n, while ChipTop reset is active-high.
        port.io := (~th.ck_rst).asAsyncReset
      }

      case (th: Zynq7CGHarness, port: CustomBootPort, chipId: Int) => {
        // Normal boot mode. Do not use custom boot address path.
        port.io := false.B
      }

      case (th: Zynq7CGHarness, port: AXI4InPort, chipId: Int) => {
        // Tie off external AXI slave/fbus input if generated.
        port.io.bits.aw.valid := false.B
        port.io.bits.aw.bits  := DontCare
        port.io.bits.w.valid  := false.B
        port.io.bits.w.bits   := DontCare
        port.io.bits.b.ready  := false.B

        port.io.bits.ar.valid := false.B
        port.io.bits.ar.bits  := DontCare
        port.io.bits.r.ready  := false.B
      }

      case (th: Zynq7CGHarness, port: UARTPort, chipId: Int) => {
        // No UART top-level port in clean IP.
        // Keep RX idle high, ignore TX.
        port.io.rxd := true.B
      }

      case (th: Zynq7CGHarness, port: JTAGPort, chipId: Int) => {
        // No JTAG top-level port in clean IP.
        // Keep JTAG inactive.
        port.io.TCK := false.B.asClock
        port.io.TMS := true.B
        port.io.TDI := false.B
        port.io.reset.foreach(_ := true.B)
      }

      case (th: Zynq7CGHarness, port: JTAGResetPort, chipId: Int) => {
        port.io := false.B
      }

      case (th: Zynq7CGHarness, port: DebugResetPort, chipId: Int) => {
        port.io := DontCare
      }

      case (th: Zynq7CGHarness, port: ClockTapPort, chipId: Int) => {
        port.io := DontCare
      }

      case (th: Zynq7CGHarness, port: SuccessPort, chipId: Int) => {
        port.io := false.B
      }

      case (th: Zynq7CGHarness, port, chipId: Int) => {
        println(s"[WithCleanZynq7CGHarnessBinders] Unhandled port type: ${port.getClass.getName}")
      }
    }

    cleanBinders
})