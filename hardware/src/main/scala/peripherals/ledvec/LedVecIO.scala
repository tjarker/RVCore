package peripherals.ledvec

import chisel3._

class LedVecIO extends Bundle {
  val led = UInt(16.W)
  led.suggestName("led")
}
