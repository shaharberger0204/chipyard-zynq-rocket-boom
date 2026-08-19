package shell.xilinx

import chisel3._
import org.chipsalliance.cde.config.Parameters

abstract class Zynq7CGShell(implicit val p: Parameters) extends RawModule {
  val CLK100MHZ = IO(Input(Clock()))
  val resetn    = IO(Input(Bool()))

  // Chipyard reset is active-high; board resetn is active-low.
  val dutReset = Wire(Bool())
  dutReset := ~resetn
}