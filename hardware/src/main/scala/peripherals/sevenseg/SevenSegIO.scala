package peripherals.sevenseg

import chisel3._

class SevenSegIO extends Bundle {
  val anode = UInt(4.W)
  anode.suggestName("an")
  val segment = UInt(7.W)
  segment.suggestName("seg")
}
