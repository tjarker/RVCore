import util._
import chisel3._
import peripherals.keyboard.Keyboard
import peripherals.keyboard.lib.PS2Port
import peripherals.ledvec.{LedVec, LedVecIO}
import peripherals.sevenseg.{SevenSeg, SevenSegIO}
import peripherals.sevenseg.SevenSeg
import rvcore.memory.RAM
import rvcore.pipeline.RVPipline
import rvcore.systembus.{ReadValueArbiter, SystemBus}


class Top(program: Program) extends Module{
  val io = IO(new Bundle{
    val led = Output(new LedVecIO)
    val sev = Output(new SevenSegIO)
    val ps2 = Input(new PS2Port)
  })

  // processor
  val mp = Module(new RVPipline)

  // the system bus
  val sysBus = Wire(new SystemBus)
  sysBus.sendRq.rdData := 0.U
  sysBus.sendRq.rq := 0.B


  //System bus mapped devices///////////////////////////////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  //Memory//////////////////////////////////////////////////////////////////////////////////////////////////////////////

  val ram = RAM(sysBus,0x0000,4096)

  //peripherals/////////////////////////////////////////////////////////////////////////////////////////////////////////

  val ledVec = LedVec(sysBus, 0x2000)
  io.led <> ledVec.led

  val sev = SevenSeg(sysBus, 0x2100)
  io.sev <> sev.sev

  val key = Keyboard(sysBus,0x2200)
  key.ps2 <> io.ps2

  //read value arbitration//////////////////////////////////////////////////////////////////////////////////////////////

  //mp.io.dataBus.rdData := ReadValueArbiter(Seq(ram, key, ledVec, sev))

  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
}

object Top extends App {
  if(args.length == 0) {
    val program = BinaryLoader.loadProgram("output/blink2/blink2.bin")
    chisel3.Driver.execute(Array("--target-dir","output/blink2"),() => new Top(program))
  }else{
    val program = BinaryLoader.loadProgram(args(0))
    val name = args(0).split("/").last.dropRight(4)
    chisel3.Driver.execute(Array(args(1),args(2),"--top-name",s"Top_${name}"), () => new Top(program))
  }
}