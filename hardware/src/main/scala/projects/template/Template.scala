package projects.template

import chisel3.{Module, Output}
import peripherals.ledvec.{LedVec, LedVecIO}
import projects.typewriter.TypeWriterCore
import rvcore.BareCore
import rvcore.memory.{RAM, ROM}
import rvcore.util.{BinaryLoader, Constructor}

class Template extends BareCore {

  val led = IO(Output(new LedVecIO))

  val rom = ROM("ROM",0x0000,BinaryLoader.loadProgram("../projects/template/output/template.bin"))
  pipeline.io.instrBus <> rom.instrBus

  val ram = RAM("RAM0",0x1000,4096)

  val ledm = Module(new LedVec("led",0x2000))
  led <> ledm.led

}


object Template extends Constructor(() => new Template)