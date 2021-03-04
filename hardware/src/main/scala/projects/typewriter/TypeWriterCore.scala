package projects.typewriter

import rvcore.BareCore
import rvcore.memory.{RAM, ROM}
import util.{BinaryLoader, CoreGenerator}
import chisel3._

class TypeWriterCore extends BareCore{

  val rom = ROM("ROM",0x0000,BinaryLoader.loadProgramFromRes("addneg"))
  pipeline.io.instrBus <> rom.instrBus

  val ram = RAM("RAM0",0x1000,4096)



}

object TypeWriterCore extends App {
  Module((new TypeWriterCore)).generateHeader()
}
