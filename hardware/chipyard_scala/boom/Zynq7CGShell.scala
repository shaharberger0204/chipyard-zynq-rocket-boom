package sifive.fpgashells.shell.xilinx.zynq7cgshell

import chisel3._
import org.chipsalliance.cde.config._
import freechips.rocketchip.util._

abstract class Zynq7CGShell(implicit val p: Parameters) extends RawModule {

  // Clean Zynq7CG IP top-level IO
  val CLK100MHZ = IO(Input(Clock()))
  val ck_rst    = IO(Input(Bool()))

  // Internal clocks expected by the harness/config.
  // For now, all are driven directly from the 100 MHz board/PS clock.
  val clock_8MHz  = Wire(Clock())
  val clock_32MHz = Wire(Clock())
  val clock_65MHz = Wire(Clock())

  clock_8MHz  := CLK100MHZ
  clock_32MHz := CLK100MHZ
  clock_65MHz := CLK100MHZ

  // Internal reset/status wires expected by old harness structure.
  val mmcm_locked = Wire(Bool())
  mmcm_locked := true.B

  val reset_core     = Wire(Bool())
  val reset_bus      = Wire(Bool())
  val reset_periph   = Wire(Bool())
  val reset_intcon_n = Wire(Bool())
  val reset_periph_n = Wire(Bool())

  // Treat ck_rst as reset-n / active-high "not reset".
  reset_core   := ~ck_rst
  reset_bus    := ~ck_rst
  reset_periph := ~ck_rst

  reset_intcon_n := ck_rst
  reset_periph_n := ck_rst
}
