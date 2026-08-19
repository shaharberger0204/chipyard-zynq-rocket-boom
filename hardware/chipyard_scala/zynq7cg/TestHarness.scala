package chipyard.fpga.zynq7cg

import chisel3._
import org.chipsalliance.cde.config.Parameters
import shell.xilinx.Zynq7CGShell
import chipyard.harness.HasHarnessInstantiators

class Zynq7CGHarness(override implicit val p: Parameters)
  extends Zynq7CGShell
  with HasHarnessInstantiators {

  val success = WireInit(false.B)

  // Use the single Zynq PL clock/reset for the whole design.
  def referenceClockFreqMHz = 100.0
  def referenceClock = CLK100MHZ
  def referenceReset = dutReset.asAsyncReset

  instantiateChipTops()
}