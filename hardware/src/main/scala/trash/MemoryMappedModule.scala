package trash

import chisel3._

abstract class MemoryMappedModule extends MultiIOModule{
  val sysBus = IO(new SystemBusIO)
}