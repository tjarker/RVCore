package peripherals.keyboard

import util.RingBuffer
import chisel3._
import chisel3.util._
import peripherals.keyboard.lib.PS2Port
import rvcore.systembus.{RegBusModule, RegField, RegFieldType}

class CmdBundle extends Bundle {
  val error = Bool()
  val readChar = Bool()
  val hasChar = Bool()
}
class ConfigBundle extends Bundle {
  val isActivated = Bool()
}

class Keyboard(baseAddr: Int) extends RegBusModule("KEYBOARD",baseAddr,16) {
  val ps2 = IO(Input(new PS2Port))
  val light = IO(Output(Bool()))

  val cmdReg = RegInit(0.U.asTypeOf(new CmdBundle))
  val charReg = RegInit(0.U(8.W))

  val shiftReg = RegInit(0.U(11.W))
  val countReg = RegInit(0.U(6.W))

  val accessors = regMap(
    0x00 -> RegField(cmdReg, RegFieldType.rw),
    0x04 -> RegField(charReg, RegFieldType.r),
    0x08 -> RegField(countReg, RegFieldType.rw),
    0x0C -> RegField(shiftReg, RegFieldType.rw)
  )
  light := cmdReg.hasChar

  when(cmdReg.readChar){
    cmdReg.readChar := 0.B
    cmdReg.hasChar := 0.B
  }


  def delay[T <: Data](in: T, delay: Int) : T = {
    var last = in
    for(i <- 0 until delay){
      last = RegNext(last)
    }
    last
  }
  val watchDog = RegInit(0.U(16.W))
  watchDog := watchDog + 1.U
  when(watchDog === 10000.U){
    countReg := 0.U
  }

  // when activated and falling edge on ps2 clock -> shift a bit in
  when(delay(!ps2.clk && RegNext(ps2.clk),50)){
    watchDog := 0.U
    countReg := countReg + 1.U
    val newShift = Cat(ps2.data, shiftReg(10,1))
    shiftReg := newShift
    when(countReg === 10.U){
      countReg := 0.U
      cmdReg.hasChar := 1.B
      charReg := newShift(8,1)
    }
  }



  /*
  val buffer = Module(new RingBuffer(8,8))
  buffer.io.deq.read := 0.B
  buffer.io.enq.write := 0.B



  buffer.io.enq.data := Cat(ps2.data, shiftReg(10,1))(8,1)

  // when the char is read clear the flag
  when(!cmdReg.hasChar){
    when(!buffer.io.deq.empty){
      cmdReg.hasChar := 1.B
      charReg := buffer.io.deq.data
      buffer.io.deq.read := 1.B
    }.otherwise{
      cmdReg.hasChar := 0.B
    }
  }

  def delay[T <: Data](in: T, delay: Int) : T = {
    var last = in
    for(i <- 0 until delay){
      last = RegNext(last)
    }
    last
  }

  // when activated and falling edge on ps2 clock -> shift a bit in
  when(delay(!ps2.clk && RegNext(ps2.clk),32)){
    countReg := countReg + 1.U
    shiftReg := Cat(ps2.data, shiftReg(10,1))
    when(countReg >= 11.U){
      countReg := 0.U
      when(!buffer.io.enq.full){
        buffer.io.enq.write := 1.B
      }
    }
  }
  */
}
