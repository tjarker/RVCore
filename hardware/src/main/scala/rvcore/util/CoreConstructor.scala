package rvcore.util

import chisel3.RawModule
import rvcore.BareCore
import rvcore.util.CoreConstructor.{generateHardware, generateHeaderFiles}

class CoreConstructor[T <: BareCore](fct: () => T) extends App{
  if(args.length == 0 || (args.length > 1 && args(0) == "build")) {
    generateHardware(fct,
      Array("--target-dir","../output/blink2")
    )
  } else {
    generateHeaderFiles(fct,
      Array("--target-dir","../output/blink2")
    )
  }
}

object CoreConstructor {
  def apply[T <: BareCore](core: T): T = {
    core.connectCoreModules()
    core
  }
  def generateHeaderFiles[T <: BareCore](fct: () => T, conf: Map[String,String] = Map.empty): Unit = {
    (new chisel3.stage.ChiselStage).emitVerilog({
      val a: BareCore = fct()
      a.generateHeader()
      scala.sys.exit(0)
      a
    },conf.toArray)
  }
  def generateHardware[T <: BareCore](fct: () => T, conf: Array[String] = Array.empty): Unit = {
    //if(!conf.contains("--target-dir")) conf = conf ++ Array("--target-dir","../output/")
    (new chisel3.stage.ChiselStage).emitVerilog({
      val a: BareCore = fct()
      a.connectCoreModules()
      a
    },conf)
  }
}