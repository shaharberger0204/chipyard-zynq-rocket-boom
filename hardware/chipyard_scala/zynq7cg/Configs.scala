package chipyard.fpga.zynq7cg

import org.chipsalliance.cde.config._
import freechips.rocketchip.subsystem._
import freechips.rocketchip.tile._
import freechips.rocketchip.rocket._

class WithNoRocketDTIM extends Config((site, here, up) => {
  case TilesLocated(InSubsystem) =>
    up(TilesLocated(InSubsystem)).map {
      case tp: RocketTileAttachParams =>
        // Remove Rocket scratchpad so DDR owns 0x80000000.
        tp.copy(tileParams = tp.tileParams.copy(
          dcache = tp.tileParams.dcache.map(_.copy(scratch = None))
        ))
      case other => other
    }
})

class WithZynq7CGTweaks extends Config(
  new WithCleanZynq7CGHarnessBinders ++

  // One 100 MHz PL clock drives the SoC.
  new chipyard.harness.WithHarnessBinderClockFreqMHz(100) ++
  new chipyard.harness.WithAllClocksFromHarnessClockInstantiator ++

  // External DDR window: 0x80000000-0xBFFFFFFF.
  new freechips.rocketchip.subsystem.WithNMemoryChannels(1) ++
  new freechips.rocketchip.subsystem.WithExtMemSize(0x40000000L) ++

  // Match bus frequencies to the PL clock.
  new freechips.rocketchip.subsystem.WithTimebase(100000) ++
  new chipyard.config.WithSystemBusFrequency(100) ++
  new chipyard.config.WithFrontBusFrequency(100) ++
  new chipyard.config.WithControlBusFrequency(100) ++
  new chipyard.config.WithPeripheryBusFrequency(100) ++
  new chipyard.config.WithMemoryBusFrequency(100) ++

  // No serial TileLink bridge in this FPGA build.
  new testchipip.serdes.WithNoSerialTL
)

class TinyBoomZynq7CGConfig extends Config(
  new WithZynq7CGTweaks ++
  new freechips.rocketchip.rocket.WithNBreakpoints(2) ++
  new chipyard.SmallBoomV3Config
)

class SmallRocketZynq7CGConfig extends Config(
  new WithNoRocketDTIM ++
  new WithZynq7CGTweaks ++
  new freechips.rocketchip.rocket.WithNBreakpoints(2) ++
  new chipyard.SmallRocketConfig
)

class WithZynq7CGSimulationSoCParams extends Config(
  new freechips.rocketchip.subsystem.WithNMemoryChannels(1) ++
  new freechips.rocketchip.subsystem.WithExtMemSize(0x40000000L) ++

  new freechips.rocketchip.subsystem.WithTimebase(100000) ++
  new chipyard.config.WithSystemBusFrequency(100) ++
  new chipyard.config.WithFrontBusFrequency(100) ++
  new chipyard.config.WithControlBusFrequency(100) ++
  new chipyard.config.WithPeripheryBusFrequency(100) ++
  new chipyard.config.WithMemoryBusFrequency(100)
)

class TinyBoomVerilatorConfig extends Config(
  new WithZynq7CGSimulationSoCParams ++
  new freechips.rocketchip.rocket.WithNBreakpoints(2) ++
  new chipyard.SmallBoomV3Config
)

class TinyRocketVerilatorConfig extends Config(
  new WithNoRocketDTIM ++
  new WithZynq7CGSimulationSoCParams ++
  new freechips.rocketchip.rocket.WithNBreakpoints(2) ++
  new chipyard.SmallRocketConfig
)