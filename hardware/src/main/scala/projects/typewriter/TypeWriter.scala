package projects.typewriter

import chisel3._
import peripherals.ledvec.LedVecIO
import rvcore.util.Constructor

class TypeWriter extends Module {
  val io = IO(new Bundle{
    val led = Output(new LedVecIO)
  })

  val core = Module(Constructor(new TypeWriterCore))
  io.led <> core.led
}


object TypeWriter extends Constructor(new TypeWriter,"build")