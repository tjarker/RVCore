package systembus

import chisel3._

class SystemBusIO extends Bundle {
  val addr = Input(UInt(32.W))
  val sendRq = Output(new SendRqBundle)
  val wrData = Input(UInt(32.W))
  val we = Input(Vec(4,Bool()))
  val w = Input(Bool())
}

class SystemBus extends Bundle {
  val addr = UInt(32.W)
  val sendRq = new SendRqBundle
  val wrData = UInt(32.W)
  val we = Vec(4,Bool())
  val w = Bool()
}

class SendRqBundle extends Bundle {
  val rq = Bool()
  val rdData = UInt(32.W)
}