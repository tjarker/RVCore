import chisel3._
import chisel3.util._
import lib.Interfaces.SevenSegment
import rvcore.RVCore
import rvcore.lib.{BinaryLoader, Program}
import rvcore.lib.Helper.toUInt

class Top(program: Program) extends Module{
  val io = IO(new Bundle{
    val blink = Output(UInt(16.W))
    val sev = Output(new SevenSegment)
  })

  val mp = Module(new RVCore(program.byteBinaries, simFlag = false))



  val ram = Module(new RAM(4096))
  mp.io.dataBus.rdData := ram.io.rdData
  ram.io.addr := mp.io.dataBus.addr
  ram.io.wrData := mp.io.dataBus.wrData
  ram.io.we := VecInit(Seq.fill(4)(0.B))
  ram.io.w := mp.io.dataBus.w
  when(mp.io.dataBus.w && RegNext(mp.io.dataBus.addr <= 0x1000.U)){
    ram.io.we := mp.io.dataBus.we
  }

  val blinkReg = RegInit(0.U(16.W))
  when(mp.io.dataBus.w && RegNext(mp.io.dataBus.addr === 0x2000.U)){//&
    blinkReg := toUInt(mp.io.dataBus.wrData)(31,16)
  }
  io.blink := blinkReg

  val sev = Module(new SevenSeg)
  sev.io.out <> io.sev
  sev.io.in := blinkReg
}
/*
// generate Verilog
object Top extends App{
  (new chisel3.stage.ChiselStage).execute(
    Array("-X", "verilog"),
    Seq(ChiselGeneratorAnnotation(() => new Top)))
}
*/
object Top extends App {
  if(args.length == 0) {
    println("Need a file")
    sys.exit(-1)
  }else{
    val program = BinaryLoader.loadProgram(args(0))
    chisel3.Driver.execute(Array(args(1),args(2)), () => new Top(program))
  }
}