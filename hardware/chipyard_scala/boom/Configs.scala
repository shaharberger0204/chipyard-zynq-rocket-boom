package chipyard.fpga.zynq7cg

import org.chipsalliance.cde.config._
import freechips.rocketchip.subsystem._
import freechips.rocketchip.devices.debug._
import freechips.rocketchip.devices.tilelink._
import freechips.rocketchip.diplomacy._
import freechips.rocketchip.system._
import freechips.rocketchip.tile._
import freechips.rocketchip.rocket._
import sifive.blocks.devices.uart._
import chipyard.BuildSystem

// Force-remove Rocket DTIM/scratchpad from the tile.
// This removes the tiny 0x80000000 / 0x4000 memory that overlaps DDR.
class WithNoRocketDTIM extends Config((site, here, up) => {
  case TilesLocated(InSubsystem) =>
    up(TilesLocated(InSubsystem)).map {
      case tp: RocketTileAttachParams =>
        tp.copy(
          tileParams = tp.tileParams.copy(
            dcache = tp.tileParams.dcache.map { d =>
              d.copy(scratch = None)
            }
          )
        )
      case other => other
    }
})

class WithZynq7CGTweaks extends Config(
  new WithCleanZynq7CGHarnessBinders ++
  // IO binders: expose debug reset + JTAG reset ports from the chiptop

  // Harness binders: expose Rocket AXI memory and connect debug/JTAG/UART

  new chipyard.harness.WithHarnessBinderClockFreqMHz(100) ++
  new chipyard.harness.WithAllClocksFromHarnessClockInstantiator ++

  // Keep real external memory. Do NOT use WithNoMemPort.
  new freechips.rocketchip.subsystem.WithNMemoryChannels(1) ++
  new freechips.rocketchip.subsystem.WithExtMemSize(0x40000000L) ++

  // 100 MHz FPGA clock settings
  new freechips.rocketchip.subsystem.WithTimebase(100000) ++
  new chipyard.config.WithSystemBusFrequency(100) ++
  new chipyard.config.WithFrontBusFrequency(100) ++
  new chipyard.config.WithControlBusFrequency(100) ++
  new chipyard.config.WithPeripheryBusFrequency(100) ++
  new chipyard.config.WithMemoryBusFrequency(100) ++
  new chipyard.config.WithMemoryBusFrequency(32) ++

  new testchipip.serdes.WithNoSerialTL
)

class TinyBoomZynq7CGConfig extends Config(
  // Left side has highest priority.
  new WithNoRocketDTIM ++
  new WithZynq7CGTweaks ++
  new freechips.rocketchip.rocket.WithNBreakpoints(2) ++
  new chipyard.SmallBoomV3Config
)
