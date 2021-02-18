package peripherals.sevenseg

import chisel3._

class SevenSegmentIO extends Bundle {
  val anode = UInt(4.W)
  val data = UInt(7.W)
}
