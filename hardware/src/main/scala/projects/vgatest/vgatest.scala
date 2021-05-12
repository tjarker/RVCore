package projects.vgatest


import chisel3._
import peripherals.charvga.CharVGA
import peripherals.charvga.lib.Interfaces.VGAPort
import peripherals.keyboard.Keyboard
import peripherals.keyboard.lib.PS2Port
import peripherals.ledvec.{LedVec, LedVecIO}
import peripherals.sevenseg.{SevenSeg, SevenSegIO}
import projects.typewriter.TypeWriterCore
import rvcore.BareCore
import rvcore.memory.{DROM, RAM, ROM}
import rvcore.util.{BinaryLoader, Constructor}

class vgatest extends BareCore {

  //val led = IO(Output(new LedVecIO))
  //val sev = IO(Output(new SevenSegIO))
  val program = BinaryLoader.loadProgram("../projects/vgatest/output/vgatest.bin")
  println(s"Program size = ${program.length}")
  val rom = ROM("ROM", 0x0000, 0x1000, program)
  //val rom = ROM("ROM",0x0000,BinaryLoader.loadProgram("../lib/ramtest.bin"))
  //val rom = ROM("ROM",0x0000, 0x1000,BinaryLoader.loadProgramFromRes("addneg"))
  pipeline.io.instrBus <> rom.instrBus

  val ram = RAM("RAM0",0x1000,4096)

  /*
  val ledm = Module(new LedVec(0x2000))
  led <> ledm.led

  val sevm = Module(new SevenSeg(0x3000))
  sev <> sevm.sev
*/
  val vgaPort = IO(Output(new VGAPort))
  val vga = Module(new CharVGA(0x2000))
  vgaPort <> vga.out

  val ps2 = IO(Input(new PS2Port))
  val light = IO(Output(Bool()))
  val key = Module(new Keyboard(0x5000))
  ps2 <> key.ps2
  light := key.light

  val psOut = IO(Output(new PS2Port))
  psOut <> ps2

}


object vgatest extends Constructor(new vgatest)

object MemMapvgatest extends Constructor(new vgatest, "genMemoryMap")