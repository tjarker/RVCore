package peripherals.keyboard.lib

import chisel3._


class PS2Port extends Bundle {
  val clk = Bool()
  val data = Bool()
}
