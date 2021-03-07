package rvcore.systembus

import chisel3._

object SysBusCmd {
  val IDLE = 0.U(2.W)
  val READ = 1.U(2.W)
  val WRITE = 2.U(2.W)
}

object SysBusResp {
  val NULL = 0.U(2.W)
  val SUC = 1.U(2.W)
  val FAIL = 2.U(2.W)
  val ERROR = 3.U(2.W)
}

class SysBus extends Bundle {
  val m = new MasterChannel
  val s = new SlaveChannel

  def connect(modules: Seq[BusModule]): Unit = {
    this.s.holdLow()
    modules.foreach{ cm =>
      cm.sysBusIO.m.holdLow()

      val sel = cm.isSelected(this.m.addr) && this.m.cmd =/= SysBusCmd.IDLE
      val selReg = RegNext(sel)

      when(sel) {
        cm.sysBusIO.m <> this.m
      }
      when(selReg){ // TODO: how do we keep a flag set when a response is outstanding
        this.s <> cm.sysBusIO.s
      }
    }
  }
}

class SysBusMasterIO extends Bundle {
  val m = Output(new MasterChannel)
  val s = Input(new SlaveChannel)
}

class SysBusSlaveIO extends Bundle {
  val m = Input(new MasterChannel)
  val s = Output(new SlaveChannel)
}

class MasterChannel extends Bundle {
  val cmd = UInt(2.W)
  val addr = UInt(32.W)
  val wrData = UInt(32.W)
  val strb = Vec(4, Bool())

  def holdLow() : Unit = {
    this.cmd := SysBusCmd.IDLE
    this.addr := 0.U
    this.wrData := 0.U
    this.strb := 0.U(4.W).asBools()
  }
}

class SlaveChannel extends Bundle {
  val resp = UInt(2.W)
  val rdData = UInt(32.W)

  def holdLow() : Unit = {
    this.resp := SysBusResp.ERROR
    this.rdData := 0.U
  }
}