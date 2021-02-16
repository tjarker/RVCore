package keyboard.lib

import chisel3._

object FifoInterfaces {
  class WriterIO(size: Int) extends Bundle {
    val write = Input(Bool())
    val full = Output(Bool())
    val data = Input(UInt(size.W))
  }

  class ReaderIO(size: Int) extends Bundle {
    val read = Input(Bool())
    val empty = Output(Bool())
    val data = Output(UInt(size.W))
  }
}
