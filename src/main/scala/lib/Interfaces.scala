package lib

import chisel3._
import chisel3.util._

object Interfaces {

  class SevenSegment extends Bundle {
    val anode = UInt(4.W)
    val data = UInt(7.W)
  }

  class VGAPort extends Bundle {
    val red = UInt(4.W)
    val green = UInt(4.W)
    val blue = UInt(4.W)
    val hsync = Bool()
    val vsync = Bool()
  }

  class PS2Port extends Bundle {
    val clk = Bool()
    val data = Bool()
  }

}
