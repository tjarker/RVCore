package rvcore.systembus

import chisel3._
import chisel3.util._

class SystemBusIO extends Bundle {
  val addr = Input(UInt(32.W))
  val sendRq = Output(new SendRqBundle)
  val wrData = Input(UInt(32.W))
  val we = Input(Vec(4,Bool()))
  val w = Input(Bool())

  def mapRegs[T <: Data](regs: Seq[T], baseAddr: Int, readOnly: Seq[Boolean]) : Vec[Bool] = {
    val isRead = VecInit(Seq.fill(regs.length)(0.B))
    val sendRqs = VecInit(Seq.fill(regs.length)(0.U.asTypeOf(new SendRqBundle)))
    val addr = Reg(UInt(32.W))
    addr := this.addr
    regs.zipWithIndex.foreach{ case (reg,i) =>
      val access = addr === (baseAddr + i * 4).U
      when(access){
        if(readOnly(i)){
          when(!this.w){
            sendRqs(i).rdData := reg.asUInt
            sendRqs(i).rq := 1.B
            isRead(i) := 1.B
          }
        }else{
          when(this.w){
            reg := this.wrData.asTypeOf(reg)
          }.otherwise{
            sendRqs(i).rdData := reg.asUInt
            sendRqs(i).rq := 1.B
            isRead(i) := 1.B
          }
        }
      }.otherwise{
        sendRqs(i).rdData := 0.U
        sendRqs(i).rq := 0.B
      }
    }
    this.sendRq.rq := sendRqs.map(_.rq).reduce((a,b) => a || b)
    this.sendRq.rdData := PriorityMux(sendRqs.map(s => s.rq -> s.rdData))
    isRead
  }
  def mapRegs[T <: Data](regs: Seq[T], baseAddr: Int) : Vec[Bool] = {
    this.mapRegs(regs, baseAddr, Seq.fill(regs.length)(false))
  }
  def mapReg[T <: Data](reg: T, baseAddr: Int) : Bool = {
    this.mapReg(reg,baseAddr,false)
  }
  def mapReg[T <: Data](reg: T, baseAddr: Int, readOnly: Boolean) : Bool = {
    val listener = Module(new Listener(baseAddr))
    listener.io.address := this.addr
    listener.io.write := this.w

    this.sendRq.rdData := 0.U
    this.sendRq.rq := 0.B

    when(listener.io.read){
      this.sendRq.rdData := reg.asUInt
      this.sendRq.rq := 1.B
    }

    if(!readOnly){
      when(listener.io.written){
        reg := this.wrData.asTypeOf(reg)
      }
    }
    listener.io.read
  }
}

class Listener(address: Int) extends Module {
  val io = IO(new Bundle{
    val address = Input(UInt(32.W))
    val write = Input(Bool())
    val written = Output(Bool())
    val read = Output(Bool())
  })

  val addrReg = Reg(UInt(32.W))
  addrReg := io.address

  io.read := 0.B
  io.written := 0.B
  when(addrReg === address.U){
    when(io.write){
      io.written := 1.B
    }.otherwise{
      io.read := 1.B
    }
  }
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