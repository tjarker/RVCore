package rvcore.pipeline.lib

import chisel3._

class DebugPort extends Bundle{
  val regfile = Vec(32, UInt(32.W))
  val pc = UInt(32.W)
  val instr = UInt(32.W)
}
