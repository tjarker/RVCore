package projects.template

import chisel3.{Module, Output}
import peripherals.charvga.CharVGA
import peripherals.charvga.lib.Interfaces.VGAPort
import peripherals.ledvec.{LedVec, LedVecIO}
import peripherals.sevenseg.{SevenSeg, SevenSegIO}
import projects.typewriter.TypeWriterCore
import rvcore.BareCore
import rvcore.memory.{RAM, ROM}
import rvcore.util.{BinaryLoader, Constructor}

class Template extends BareCore {

  val led = IO(Output(new LedVecIO))
  val sev = IO(Output(new SevenSegIO))
  val program = BinaryLoader.loadProgram("../projects/template/output/template.bin")
  println(s"Program size = ${program.length}")
  val rom = ROM("ROM", 0x0000, 0x1000, program)
  //val rom = ROM("ROM",0x0000,BinaryLoader.loadProgram("../lib/ramtest.bin"))
  //val rom = ROM("ROM",0x0000, 0x1000,BinaryLoader.loadProgramFromRes("addneg"))
  pipeline.io.instrBus <> rom.instrBus

  val ram = RAM("RAM0",0x1000,4096)


  val ledm = Module(new LedVec(0x2000))
  led <> ledm.led

  val sevm = Module(new SevenSeg(0x3000))
  sev <> sevm.sev


}


object Template extends Constructor(() => new Template)

object MemMapTemplate extends Constructor(() => new Template, "genMemoryMap")