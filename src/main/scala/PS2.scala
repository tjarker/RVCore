import chisel3._
import chisel3.iotesters.OrderedDecoupledHWIOTester
import chisel3.util._


class PS2 extends Module{
  val io = IO(new Bundle{
    val data = Input(Bool())
    val ps2Clock = Input(Bool())
  })

  val shiftReg = RegInit(0.U(11.W))
  when(!io.ps2Clock && RegNext(io.ps2Clock)){
    shiftReg := Cat(io.data, shiftReg(10,1))
  }
}


