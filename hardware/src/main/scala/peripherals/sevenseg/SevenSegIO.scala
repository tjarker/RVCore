package peripherals.sevenseg

import chisel3._

class SevenSegIO extends Bundle {
  val anode = UInt(4.W)
  val segment = UInt(7.W)
}
