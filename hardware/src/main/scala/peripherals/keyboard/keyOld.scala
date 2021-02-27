package peripherals.keyboard

import util.RingBuffer
import chisel3._
import chisel3.util._
import peripherals.keyboard.lib.PS2Port
import rvcore.systembus.{MemMappedReg, SystemBusIO}


class keyOld(baseAddr: Int) extends MultiIOModule {
  val ps2 = IO(Input(new PS2Port))
  val bus = IO(new SystemBusIO)

  val status = MemMappedReg(baseAddr, bus, new StatusBundle, 0x00, true)
  val config = MemMappedReg(baseAddr+4, bus, new ConfigBundle, 0x01, false)
  val char = MemMappedReg(baseAddr+8, bus, UInt(8.W),0x00, false)
  val sendRqs = Seq(status._2,config._2,char._2)
  val statusReg = status._1
  val configReg = config._1
  val charReg = char._1

  bus.sendRq.rq := sendRqs.map(_.rq).reduce((a,b) => a || b)
  bus.sendRq.rdData := PriorityMux(sendRqs.map(s => s.rq -> s.rdData))

  val buffer = Module(new RingBuffer(8,8))
  buffer.io.deq.read := 0.B
  buffer.io.enq.write := 0.B

  val shiftReg = RegInit(0.U(11.W))
  val countReg = RegInit(0.U(4.W))

  buffer.io.enq.data := Cat(ps2.data, shiftReg(10,1))(8,1)

  // when the char is read clear the flag
  when(sendRqs(2).rq || !statusReg.hasChar){
    when(!buffer.io.deq.empty){
      statusReg.hasChar := 1.B
      charReg := buffer.io.deq.data
      buffer.io.deq.read := 1.B
    }.otherwise{
      statusReg.hasChar := 0.B
    }
  }

  // when activated and falling edge on ps2 clock -> shift a bit in
  when(configReg.isActivated && !ps2.clk && RegNext(ps2.clk)){
    countReg := countReg + 1.U
    shiftReg := Cat(ps2.data, shiftReg(10,1))
    when(countReg >= 10.U){
      countReg := 0.U
      when(!buffer.io.enq.full){
        buffer.io.enq.write := 1.B
      }
    }
  }
}