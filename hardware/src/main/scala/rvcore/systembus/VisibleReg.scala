package rvcore.systembus

import chisel3._

class VisibleReg[T <: Data]() {
  val a = Reg(UInt())
}
