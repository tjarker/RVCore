package util


import chisel3._
import chisel3.util._

object FIFO {
  class EnqueuerIO[T <: Data] extends Bundle {
    val write = Input(Bool())
    val full = Output(Bool())
    val data = Input(new T)
  }

  class DequeuerIO[T <: Data] extends Bundle {
    val read = Input(Bool())
    val empty = Output(Bool())
    val data = Output(new T)
  }
}

class FIFO[T <: Data](capacity: Int) extends MultiIOModule {

  val enq = IO(new FIFO.EnqueuerIO[T])
  val deq = IO(new FIFO.DequeuerIO[T])

  val mem = SyncReadMem(capacity, new T)

  val head = RegInit(0.U((log2Ceil(capacity)).W))
  val tail = RegInit(0.U((log2Ceil(capacity)).W))
  val wrapBitHead = RegInit(0.B)
  val wrapBitTail = RegInit(0.B)

  // wrap signal
  val wrap = (capacity - 1).U

  // full and empty signals
  val full = WireDefault(false.B)
  val empty = WireDefault(false.B)

  when(head === tail) {
    when(wrapBitHead === wrapBitTail) {
      empty := true.B
    }.otherwise {
      full := true.B
    }
  }

  // write operation
  when(enq.write && !full) {
    mem.write(head, enq.data)
    when(head === wrap) {
      head := 0.U
      wrapBitHead := !wrapBitHead
    }.otherwise {
      head := head + 1.U
    }
  }

  // read operation
  deq.data := mem.read(tail)
  when(deq.read && !empty) {
    when(tail === wrap) {
      tail := 0.U
      wrapBitTail := !wrapBitTail
    }.otherwise {
      tail := tail + 1.U
    }
  }

  enq.full := full
  deq.empty := empty
}