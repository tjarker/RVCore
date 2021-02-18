package rvcore.lib

import chisel3.util._
import chisel3._
import chisel3.internal.firrtl.Width

object Helper {
  def toByteVec[T <: Bits](int: T): Vec[UInt] = {
    return VecInit(int(7,0),int(15,8),int(23,16),int(31,24))
  }
  def toUInt(bytes: Vec[UInt]): UInt = {
    return Cat(bytes(3),bytes(2),bytes(1),bytes(0)).asUInt
  }
  def toSInt(bytes: Vec[UInt]): SInt = {
    return Cat(bytes(3),bytes(2),bytes(1),bytes(0)).asSInt
  }
}

class DataBusIO extends Bundle {
  val addr = Input(UInt(32.W))
  val rdData = Output(UInt(32.W))
  val wrData = Input(UInt(32.W))
  val we = Input(Vec(4,Bool()))
  val w = Input(Bool())
}