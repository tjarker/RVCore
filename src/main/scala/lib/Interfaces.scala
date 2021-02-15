package lib

import chisel3._
import chisel3.util._

object Interfaces {

  class SevenSegment extends Bundle {
    val anode = UInt(4.W)
    val data = UInt(7.W)
  }



  class PS2Port extends Bundle {
    val clk = Bool()
    val data = Bool()
  }

}
