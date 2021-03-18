package rvcore.lib

import chisel3.util._
import chisel3._
import chisel3.internal.firrtl.Width

object Helper {
  def DatatoByteVec[T <: Bits](int: T): Vec[UInt] = {
    return VecInit(int(7,0),int(15,8),int(23,16),int(31,24))
  }
  def byteVecToUInt(bytes: Vec[UInt]): UInt = {
    return Cat(bytes(3),bytes(2),bytes(1),bytes(0)).asUInt
  }
}