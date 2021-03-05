package projects.typewriter

import rvcore.{BareCore, CoreConstructor}
import rvcore.memory.{RAM, ROM}
import util.{BinaryLoader, CoreGenerator}
import chisel3._
import peripherals.ledvec.LedVec

class TypeWriterCore extends BareCore{

  val rom = ROM("ROM",0x0000,BinaryLoader.loadProgramFromRes("addneg"))
  pipeline.io.instrBus <> rom.instrBus

  val ram = RAM("RAM0",0x1000,4096)

  val led = Module(new LedVec("led",0x2000))

}

object TypeWriterCore extends CoreConstructor(() => new TypeWriterCore)

