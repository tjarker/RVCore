import chisel3._
import chisel3.util._
import keyboard.PS2
import keyboard.lib.PS2Port
import lib.Interfaces.SevenSegment
import rvcore.RVCore
import rvcore.lib.{BinaryLoader, Program}
import rvcore.lib.Helper.toUInt

class Top(program: Program) extends Module{
  val io = IO(new Bundle{
    val blink = Output(UInt(16.W))
    val sev = Output(new SevenSegment)
    val ps2 = Input(new PS2Port)
    val btn = Input(Bool())
  })

  val mp = Module(new RVCore(program.byteBinaries, simFlag = false))

  val key = Module(new PS2)
  key.ps2 <> io.ps2
  key.bus.clear := 0.B

  val ram = Module(new RAM(4096))
  mp.io.dataBus.rdData := ram.io.rdData

  ram.io.addr := mp.io.dataBus.addr
  ram.io.wrData := mp.io.dataBus.wrData
  ram.io.we := VecInit(Seq.fill(4)(0.B))
  ram.io.w := mp.io.dataBus.w
  when(mp.io.dataBus.w && RegNext(mp.io.dataBus.addr <= 0x1000.U)){
    ram.io.we := mp.io.dataBus.we
  }

  when(RegNext(mp.io.dataBus.addr === 0x2100.U)){
    mp.io.dataBus.rdData := Seq.fill(4)(0.U)
    mp.io.dataBus.rdData(0) := key.bus.flag
  }
  when(RegNext(mp.io.dataBus.addr === 0x2200.U)){
    mp.io.dataBus.rdData := Seq.fill(4)(0.U)
    mp.io.dataBus.rdData(0) := key.bus.data
    key.bus.clear := 1.B
  }

  val btnReg = RegInit(0.B)
  when(io.btn){
    btnReg := 1.B
  }
  when(RegNext(mp.io.dataBus.addr === 0x2300.U)){
    mp.io.dataBus.rdData := Seq.fill(4)(0.U)
    mp.io.dataBus.rdData(0) := btnReg.asUInt
    btnReg := 0.B
  }

  val blinkReg = RegInit(0.U(16.W))
  when(mp.io.dataBus.w && RegNext(mp.io.dataBus.addr === 0x2000.U)){//&
    blinkReg := toUInt(mp.io.dataBus.wrData)(15,0)
  }
  io.blink := blinkReg
  val sev = Module(new SevenSeg)
  sev.io.out <> io.sev
  sev.io.in := blinkReg
}

object Top extends App {
  if(args.length == 0) {
    val program = BinaryLoader.loadProgram("output/key/key.bin")
    chisel3.Driver.execute(Array("--target-dir","output/key"),() => new Top(program))
  }else{
    val program = BinaryLoader.loadProgram(args(0))
    val name = args(0).split("/").last.dropRight(4)
    chisel3.Driver.execute(Array(args(1),args(2),"--top-name",s"Top_${name}"), () => new Top(program))
  }
}