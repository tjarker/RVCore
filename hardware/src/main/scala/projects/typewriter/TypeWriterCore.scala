package projects.typewriter

import rvcore.BareCore
import rvcore.memory.{RAM, ROM}
import util.BinaryLoader

class TypeWriterCore extends BareCore{

  val rom = ROM("ROM",0x0000,BinaryLoader.loadProgramFromRes("addneg"))
  pipeline.io.instrBus <> rom.instrBus

  val ram = RAM("RAM0",0x1000,4096)


  connectCoreModules()
  generateHeader()
}

object TypeWriterCore extends App {
  chisel3.Driver.execute(Array("--target-dir","../output/blink2"),() => new TypeWriterCore)
}