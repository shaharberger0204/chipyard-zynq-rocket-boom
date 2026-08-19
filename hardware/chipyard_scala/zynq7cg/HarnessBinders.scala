package chipyard.fpga.zynq7cg

import chisel3._
import org.chipsalliance.cde.config.Config
import chipyard.harness.{HarnessBinders, HarnessBinderFunction}
import chipyard.iobinders._

class WithCleanZynq7CGHarnessBinders extends Config((site, here, up) => {
  case HarnessBinders =>
    val binders: HarnessBinderFunction = {
      case (th: Zynq7CGHarness, port: AXI4MemPort, chipId: Int) => {
        // Cached DDR/shared-memory AXI master.
        val axiMem = IO(chiselTypeOf(port.io.bits)).suggestName("axi4_mem_0")
        axiMem <> port.io.bits
      }

      case (th: Zynq7CGHarness, port: AXI4MMIOPort, chipId: Int) => {
        // Uncached MMIO AXI master.
        val axiMmio = IO(chiselTypeOf(port.io.bits)).suggestName("axi4_mmio_0")
        axiMmio <> port.io.bits
      }

      case (th: Zynq7CGHarness, port: ClockPort, chipId: Int) => {
        port.io := th.CLK100MHZ
      }

      case (th: Zynq7CGHarness, port: ResetPort, chipId: Int) => {
        port.io := th.dutReset.asAsyncReset
      }

      case (th: Zynq7CGHarness, port: CustomBootPort, chipId: Int) => {
        // Enable boot helper for DDR boot at 0x80000000.
        port.io := true.B
      }

      case (th: Zynq7CGHarness, port: UARTPort, chipId: Int) => {
        port.io.rxd := true.B
      }

      case (th: Zynq7CGHarness, port: JTAGPort, chipId: Int) => {
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
        println(s"[Zynq7CG] Unhandled harness port: ${port.getClass.getName}")
      }
    }

    binders
})