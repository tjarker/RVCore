package util

import chisel3.util.log2Ceil
import chisel3._

object Timing {
  def tickCounter(max: Int, tick: Bool) = {
    val cntReg = RegInit(0.U(log2Ceil(max).W))
    when(tick) {
      cntReg := Mux(cntReg === max.U, 0.U, cntReg + 1.U)
    }
    cntReg
  }
  def tickGen(frequency: Int) = {
    val cntReg = RegInit(0.U((if (frequency == 0 || log2Ceil(100000000 / frequency) == 0) 1 else log2Ceil(100000000 / frequency)).W))
    val tick = cntReg === (if (frequency != 0) 100000000 / frequency else 0).U
    cntReg := Mux(tick, 0.U, cntReg + 1.U)
    tick
  }
}
