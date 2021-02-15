package charvga.lib

import chisel3._

object Interfaces {
  class VGAPort extends Bundle {
    val red = UInt(4.W)
    val green = UInt(4.W)
    val blue = UInt(4.W)
    val hsync = Bool()
    val vsync = Bool()
  }
}
