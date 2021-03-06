package projects.typewriter

import rvcore.BareCore
import rvcore.memory.{RAM, ROM}
import chisel3._
import peripherals.ledvec.{LedVec, LedVecIO}
import rvcore.util.{BinaryLoader, CoreConstructor}

class TypeWriterCore extends BareCore{

  val led = IO(Output(new LedVecIO))

  val rom = ROM("ROM",0x0000,BinaryLoader.loadProgramFromRes("addneg"))
  pipeline.io.instrBus <> rom.instrBus

  val ram = RAM("RAM0",0x1000,4096)

  val ledm = Module(new LedVec("led",0x2000))
  led <> ledm.led

}

object TypeWriterCore extends CoreConstructor(() => new TypeWriterCore)

