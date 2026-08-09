package chipyard.fpga.zynq7cg

import chisel3._

import org.chipsalliance.cde.config.{Parameters}
import sifive.fpgashells.shell.xilinx.zynq7cgshell.{Zynq7CGShell}
import chipyard.harness.{HasHarnessInstantiators}

class Zynq7CGHarness(override implicit val p: Parameters)
  extends Zynq7CGShell
  with HasHarnessInstantiators {

  // ck_rst is reset-n, so internal reset is active-high reset.
  val hReset = Wire(Reset())
  hReset := ~ck_rst

  // Must be a writable wire because default Chipyard harness binders may drive it.
  val success = WireInit(false.B)

  def referenceClockFreqMHz = 100.0
  def referenceClock = CLK100MHZ
  def referenceReset = hReset

  instantiateChipTops()
}
