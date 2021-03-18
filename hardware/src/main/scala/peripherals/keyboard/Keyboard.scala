package peripherals.keyboard

import util.RingBuffer
import chisel3._
import chisel3.util._
import peripherals.keyboard.lib.PS2Port
import rvcore.systembus.RegBusModule

class StatusBundle extends Bundle {
  val hasChar = Bool()
}
class ConfigBundle extends Bundle {
  val isActivated = Bool()
}

class Keyboard(refName: String, baseAddr: Int) extends RegBusModule("key_t",refName,baseAddr,3) {
  val ps2 = IO(Input(new PS2Port))

  val statusReg = RegInit(0.U.asTypeOf(new StatusBundle))
  val configReg = RegInit(1.U.asTypeOf(new ConfigBundle))
  val charReg = RegInit(0.U(8.W))


  val buffer = Module(new RingBuffer(8,8))
  buffer.io.deq.read := 0.B
  buffer.io.enq.write := 0.B

  val shiftReg = RegInit(0.U(11.W))
  val countReg = RegInit(0.U(4.W))

  buffer.io.enq.data := Cat(ps2.data, shiftReg(10,1))(8,1)

  // when the char is read clear the flag
  when(!statusReg.hasChar){
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
