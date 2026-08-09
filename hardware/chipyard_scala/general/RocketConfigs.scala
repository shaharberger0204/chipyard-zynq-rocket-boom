package chipyard

import org.chipsalliance.cde.config.{Config}
import freechips.rocketchip.prci.{AsynchronousCrossing}
import freechips.rocketchip.subsystem.{InCluster}
import freechips.rocketchip.devices.tilelink.{BootROMParams, BootROMLocated}

// --------------
// Rocket Configs
// --------------

class RocketConfig extends Config(
  // Adds the AXI4 Master for Memory (DDR4)
  // new freechips.rocketchip.subsystem.WithExtMem ++ 
  // Adds the AXI4 Master for Peripherals (GPIO)
  new freechips.rocketchip.subsystem.WithDefaultMMIOPort ++ 
  // Adds the AXI4 Slave (so ARM can talk to Rocket)
  new freechips.rocketchip.subsystem.WithDefaultSlavePort ++ 
  new freechips.rocketchip.subsystem.WithBootROMFile("bootrom.img") ++ 
  new freechips.rocketchip.rocket.WithNHugeCores(1) ++ 
  new chipyard.config.AbstractConfig)

class DualRocketConfig extends Config(
  new freechips.rocketchip.rocket.WithNHugeCores(2) ++
  new chipyard.config.AbstractConfig)

class TinyRocketConfig extends Config(          
  // 1. Enables AXI Master/Slave for communication with the Zynq PS
  new freechips.rocketchip.subsystem.WithDefaultMMIOPort ++ 
  new freechips.rocketchip.subsystem.WithDefaultSlavePort ++ 
  
  // 2. Uses the standard mixin to handle FileName implementation[cite: 14]
  new freechips.rocketchip.subsystem.WithBootROMFile("bootrom.img") ++ 
  
  new testchipip.soc.WithNoScratchpads ++                          
  
  // 3. MUST BE 1: Restores the mbus needed for AXI (DRAM) communication[cite: 14]
  new freechips.rocketchip.subsystem.WithNBanks(1) ++ 
  
  new freechips.rocketchip.rocket.With1TinyCore ++                 
  new chipyard.config.AbstractConfig)

class Cloned64RocketConfig extends Config(
  new freechips.rocketchip.rocket.WithCloneRocketTiles(63, 0) ++ 
  new freechips.rocketchip.rocket.WithNHugeCores(1) ++            
  new chipyard.config.AbstractConfig)

class RV32RocketConfig extends Config(             
  new freechips.rocketchip.rocket.WithRV32 ++            
  new freechips.rocketchip.rocket.WithNHugeCores(1) ++
  new chipyard.config.AbstractConfig)

// DOC include start: l1scratchpadrocket
class ScratchpadOnlyRocketConfig extends Config(
  new chipyard.config.WithL2TLBs(0) ++
  new testchipip.soc.WithNoScratchpads ++                      
  new freechips.rocketchip.subsystem.WithNBanks(0) ++
  new freechips.rocketchip.subsystem.WithNoMemPort ++          
  new freechips.rocketchip.rocket.WithScratchpadsOnly ++       
  new freechips.rocketchip.rocket.WithNHugeCores(1) ++
  new chipyard.config.AbstractConfig)
// DOC include end: l1scratchpadrocket

class MMIOScratchpadOnlyRocketConfig extends Config(
  new freechips.rocketchip.subsystem.WithDefaultMMIOPort ++  
  new freechips.rocketchip.subsystem.WithDefaultSlavePort ++ 
  new chipyard.config.WithL2TLBs(0) ++
  new testchipip.soc.WithNoScratchpads ++                      
  new freechips.rocketchip.subsystem.WithNBanks(0) ++
  new freechips.rocketchip.subsystem.WithNoMemPort ++          
  new freechips.rocketchip.rocket.WithScratchpadsOnly ++       
  new freechips.rocketchip.rocket.WithNHugeCores(1) ++
  new chipyard.config.AbstractConfig)

class L1ScratchpadRocketConfig extends Config(
  new chipyard.config.WithRocketICacheScratchpad ++          
  new chipyard.config.WithRocketDCacheScratchpad ++          
  new freechips.rocketchip.rocket.WithNHugeCores(1) ++
  new chipyard.config.AbstractConfig)

class MulticlockRocketConfig extends Config(
  new freechips.rocketchip.rocket.WithAsynchronousCDCs(8, 3) ++ 
  new freechips.rocketchip.rocket.WithNHugeCores(1) ++
  // Frequency specifications
  new chipyard.config.WithTileFrequency(1000.0) ++
  new chipyard.clocking.WithClockGroupsCombinedByName(("uncore"   , Seq("sbus", "cbus", "implicit", "clock_tap"), Nil),
                                                      ("periphery", Seq("pbus", "fbus"), Nil)) ++
  new chipyard.config.WithSystemBusFrequency(500.0) ++
  new chipyard.config.WithMemoryBusFrequency(500.0) ++
  new chipyard.config.WithPeripheryBusFrequency(500.0) ++
  // Crossing specifications
  new chipyard.config.WithFbusToSbusCrossingType(AsynchronousCrossing()) ++
  new chipyard.config.WithCbusToPbusCrossingType(AsynchronousCrossing()) ++
  new chipyard.config.WithSbusToMbusCrossingType(AsynchronousCrossing()) ++
  new chipyard.config.AbstractConfig)

class CustomIOChipTopRocketConfig extends Config(
  new chipyard.example.WithBrokenOutUARTIO ++
  new chipyard.example.WithCustomChipTop ++
  new chipyard.example.WithCustomIOCells ++
  new freechips.rocketchip.rocket.WithNHugeCores(1) ++         
  new chipyard.config.AbstractConfig)

class PrefetchingRocketConfig extends Config(
  new barf.WithHellaCachePrefetcher(Seq(0), barf.SingleStridedPrefetcherParams()) ++
  new barf.WithTLICachePrefetcher(barf.MultiNextLinePrefetcherParams()) ++
  new barf.WithTLDCachePrefetcher(barf.SingleAMPMPrefetcherParams()) ++
  new chipyard.config.WithTilePrefetchers ++
  new freechips.rocketchip.rocket.WithL1DCacheNonblocking(2) ++
  new freechips.rocketchip.rocket.WithNHugeCores(1) ++                                   
  new chipyard.config.AbstractConfig)

class ClusteredRocketConfig extends Config(
  new freechips.rocketchip.rocket.WithNHugeCores(4, location=InCluster(1)) ++
  new freechips.rocketchip.rocket.WithNHugeCores(4, location=InCluster(0)) ++
  new freechips.rocketchip.subsystem.WithCluster(1) ++
  new freechips.rocketchip.subsystem.WithCluster(0) ++
  new chipyard.config.AbstractConfig)

class FastRTLSimRocketConfig extends Config(
  new freechips.rocketchip.subsystem.WithoutTLMonitors ++
  new freechips.rocketchip.rocket.WithNHugeCores(1) ++
  new chipyard.config.AbstractConfig)

class SV48RocketConfig extends Config(
  new freechips.rocketchip.rocket.WithSV48 ++
  new freechips.rocketchip.rocket.WithNHugeCores(1) ++
  new chipyard.config.AbstractConfig)

// Rocket with asynchronous reset for all domains except for the Rocket Tile itself
class AsyncResetRocketConfig extends Config(
  new chipyard.clocking.WithAsyncClockGroups("uncore") ++ 
  new chipyard.config.WithAsyncResetRocketSubsystem ++    
  new chipyard.clocking.WithClockGroupsCombinedByName(    
    ("tile", Seq("tile"), Nil),
    ("uncore", Seq("sbus", "mbus", "pbus", "fbus", "cbus", "obus", "implicit", "clock_tap"), Seq("tile")),
  ) ++
  new MulticlockRocketConfig)