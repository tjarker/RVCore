package rvcore

import util._
import chisel3._
import peripherals.keyboard.Keyboard
import peripherals.keyboard.lib.PS2Port
import peripherals.ledvec.{LedVec, LedVecIO}
import peripherals.sevenseg.{SevenSeg, SevenSegIO}
import rvcore.memory.{RAM, ROM}
import rvcore.pipeline.RVPipeline
import rvcore.systembus.{BusModule, MemoryMapper, SysBus, SystemBus}

import scala.collection.mutable.ListBuffer


class RVCoreImpl(program: Program) extends Module{
  val io = IO(new Bundle{
    val led = Output(new LedVecIO)
  })
  val coreDevs: ListBuffer[BusModule] = ListBuffer()

  // the system bus
  val sysBus = Wire(new SysBus)

  // processor
  val p = Module(new RVPipeline)
  p.io.sysBusIO <> sysBus

  //System bus mapped devices///////////////////////////////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  //Memory//////////////////////////////////////////////////////////////////////////////////////////////////////////////

  val rom = ROM("ROM",0x0000,program)
  coreDevs.append(rom)
  p.io.instrBus <> rom.instrBus

  val ram = RAM("RAM",0x1000,4096)
  coreDevs.append(ram)




  //peripherals/////////////////////////////////////////////////////////////////////////////////////////////////////////

  io.led.led := 0.U

  //read value arbitration//////////////////////////////////////////////////////////////////////////////////////////////

  MemoryMapper(this)
  sysBus.connect(coreDevs)

  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  def getAccessorMap: Seq[BusModule] = {
    val fields = (Map[String, Any]() /: this.getClass.getDeclaredFields) { (a, f) =>
      f.setAccessible(true)
      a + (f.getName -> f.get(this))
    }

    fields.filter(p => p._2.isInstanceOf[BusModule]).map(_._2.asInstanceOf[BusModule]).toSeq
  }
}

object RVCoreImpl extends App {
  if(args.length == 0) {
    val program = BinaryLoader.loadProgram("../output/blink2/blink2.bin")
    chisel3.Driver.execute(Array("--target-dir","../output/blink2"),() => new RVCoreImpl(program))
  }else{
    val program = BinaryLoader.loadProgram(args(0))
    val name = args(0).split("/").last.dropRight(4)
    chisel3.Driver.execute(Array(args(1),args(2),"--top-name",s"Top_${name}"), () => new RVCoreImpl(program))
  }
}