package keyboard

import chisel3._
import chisel3.util._
import keyboard.lib.PS2Port


class PS2 extends MultiIOModule{
  val ps2 = IO(Input(new PS2Port))
  val bus = IO(new Bundle{
    val data = Output(UInt(8.W))
    val flag = Output(UInt(8.W))
    val clear = Input(Bool())
  })

  // TODO: add a time out counter that resets count reg when no rising edge has occurred in a long time -> resynchronization

  val buffer = Module(new RingBuffer(8,16))
  buffer.io.enq.write := 0.B

  val shiftReg = RegInit(0.U(11.W))
  val countReg = RegInit(0.U(4.W))

  buffer.io.enq.data := Cat(ps2.data, shiftReg(10,1))(8,1)

  bus.data := buffer.io.deq.data
  bus.flag := (!buffer.io.deq.empty).asUInt
  buffer.io.deq.read := bus.clear

  when(!ps2.clk && RegNext(ps2.clk)){
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


