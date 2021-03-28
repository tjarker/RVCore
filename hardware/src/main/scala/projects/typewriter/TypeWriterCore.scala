package projects.typewriter

import rvcore.BareCore
import rvcore.memory.{RAM_old, ROM}
import chisel3._
import peripherals.ledvec.{LedVec, LedVecIO}
import rvcore.util.{BinaryLoader, Constructor}

class TypeWriterCore extends BareCore{

  val led = IO(Output(new LedVecIO))

  val rom = ROM("ROM",0x0000, 0x1000,BinaryLoader.loadProgramFromRes("addneg"))
  pipeline.io.instrBus <> rom.instrBus

  val ram = RAM_old("RAM0",0x1000,4096)

  val ledm = Module(new LedVec(0x2100))
  led <> ledm.led

}

object TypeWriterCore extends Constructor(() => new TypeWriterCore)

