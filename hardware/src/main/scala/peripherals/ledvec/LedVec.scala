package peripherals.ledvec

import chisel3._
import rvcore.systembus.{MemoryMappedModule, SystemBus}

class LedVec(baseAddr: Int) extends MemoryMappedModule{
  val led = IO(Output(new LedVecIO))

  val data = RegInit(0x00.U(16.W))
  val isRead = dontTouch(Wire(Bool()))
  isRead := sysBus.mapReg(data,baseAddr)

  led.led := data
}

object LedVec {
  def apply(sysBus: SystemBus, baseAddr: Int) : LedVec = {
    val ledVec = Module(new LedVec(baseAddr))
    ledVec.sysBus.addr := sysBus.addr
    ledVec.sysBus.wrData := sysBus.wrData
    ledVec.sysBus.we := sysBus.we
    ledVec.sysBus.w := sysBus.w
    ledVec
  }
}
