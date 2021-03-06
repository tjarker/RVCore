package trash

import chisel3._

object MemMappedReg {
  def apply[T <: Data](addr: Int, bus: SystemBusIO, t: T, readOnly: Boolean) = {
    val reg = RegInit(0.U.asTypeOf(t))
    reg := reg
    val sendRq = Wire(new SendRqBundle)
    sendRq.rq := 0.B
    sendRq.rdData := reg.asUInt
    when(RegNext(bus.addr === addr.U)) {
      when(bus.w) {
        if (!readOnly) reg := bus.wrData.asTypeOf(t)
      }.otherwise {
        sendRq.rq := 1.B
      }
    }
    (reg, sendRq)
  }

  def apply[T <: Data](addr: Int, bus: SystemBusIO, t: T, init: Int, readOnly: Boolean) = {
    val reg = RegInit(init.U.asTypeOf(t))
    reg := reg
    val sendRq = Wire(new SendRqBundle)
    sendRq.rq := 0.B
    sendRq.rdData := reg.asUInt
    when(RegNext(bus.addr === addr.U)) {
      when(bus.w) {
        if (!readOnly) reg := bus.wrData.asTypeOf(t)
      }.otherwise {
        sendRq.rq := 1.B
      }
    }
    (reg, sendRq)
  }
}
