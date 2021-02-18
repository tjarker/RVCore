package peripherals.charvga

import peripherals.charvga.lib.Interfaces.VGAPort
import chisel3._
import chisel3.util._

class CharVGA extends MultiIOModule{
  val out = IO(Output(new VGAPort))
}
