import chisel3._
import chisel3.util._
import rvcore.lib.DataBusIO
import rvcore.lib.Helper.toUInt

class RAM(size: Int) extends Module{
  val io = IO(Flipped(new DataBusIO))

  val banks = Seq.fill(4)(Mem(size / 4, UInt(8.W)))

  val address = RegNext(io.addr)

  val byteOffset = Wire(UInt(2.W))
  byteOffset := address(1, 0)

  val rdPorts = VecInit(Seq.tabulate(4)(i => banks(i).read(Mux(address(1, 0) > i.U, address(31, 2) + 1.U, address(31, 2)))))
  io.rdData := VecInit(Seq.tabulate(4)(i => rdPorts(byteOffset + i.U)))

  /*val wrVec = VecInit(Seq.tabulate(4)(i => io.wrData(byteOffset + i.U)))
  val enVec = VecInit(Seq.tabulate(4)(i => io.we(byteOffset + i.U)))

  for(i <- 0 until 4){
    when(enVec(i)){
      banks(i).write(Mux(address(1,0) > i.U, address(31,2) + 1.U, address(31,2)),wrVec(i))
    }
  }*/
  val wrData = toUInt(io.wrData)
  val wrDataInVec = WireDefault(VecInit(Seq.tabulate(4)(i => wrData((i * 8) + 7, i * 8).asUInt).reverse)) //TODO: find a way without using reverse :D
  val wrVec = WireDefault(VecInit(Seq.tabulate(4)(i => wrDataInVec(byteOffset + i.U)).reverse))
  val enVec = VecInit(Seq.tabulate(4)(i => io.we(byteOffset + i.U)))

  when(io.w) {
    Seq.tabulate(4)(i => when(enVec(i)) {
      banks(i).write(Mux(address(1, 0) > i.U, address(31, 2) + 1.U, address(31, 2)), wrVec(i))
    })
  }
}
