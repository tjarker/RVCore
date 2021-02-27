package rvcore.systembus

import chisel3._

class InstrBus extends Bundle {
  val pc = Output(UInt(32.W))
  val instr = Input(UInt(32.W))
}
