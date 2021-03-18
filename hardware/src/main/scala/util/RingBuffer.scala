package util

import chisel3._
import chisel3.util._

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

class RingBuffer(width: Int, capacity: Int) extends Module {
  val io = IO(new Bundle {
    val enq = new WriterIO(width)
    val deq = new ReaderIO(width)
  })

  // storage elements
  val mem = RegInit(VecInit(Seq.fill(capacity)(0.U(width.W))))
  val head = RegInit(0.U((log2Ceil(capacity)).W))
  val tail = RegInit(0.U((log2Ceil(capacity)).W))
  val wrapBitHead = RegInit(false.B)
  val wrapBitTail = RegInit(false.B)

  // wrap signal
  val wrap = (capacity - 1).U

  // full and empty conditions
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
  when(io.enq.write && !full) {
    mem(head) := io.enq.data
    when(head === wrap) {
      head := 0.U
      wrapBitHead := !wrapBitHead
    }.otherwise {
      head := head + 1.U
    }
  }

  // read operation
  io.deq.data := mem(tail)
  when(io.deq.read && !empty) {
    when(tail === wrap) {
      tail := 0.U
      wrapBitTail := !wrapBitTail
    }.otherwise {
      tail := tail + 1.U
    }
  }

  io.enq.full := full
  io.deq.empty := empty
}