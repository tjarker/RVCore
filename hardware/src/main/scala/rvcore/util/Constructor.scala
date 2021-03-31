package rvcore.util

import chisel3.RawModule
import rvcore.BareCore

class Constructor[T <: RawModule](fct: => T, command: String = "build", args: Array[String] = Array.empty) extends App{
  Constructor.run(this.getClass.getCanonicalName.split('.')(1),fct,command,args)
}
object Constructor {

  def apply[T <: BareCore](core: T): T = {
    core.connectCoreModules()
    core
  }

  def run[T <: RawModule](projectName: String, fct: => T, command: String = "build", args: Array[String] = Array.empty) : Unit = {
    var localArgs = args
    if(command == "build") {
      if(!localArgs.contains("--target-dir")) localArgs = localArgs ++ Array("--target-dir", s"../projects/${projectName.toLowerCase}/output")
      if(!localArgs.contains("--top-name")) localArgs = localArgs ++ Array("-o", s"Top_$projectName")
      generateHardware(fct, localArgs)
    } else if(command == "genMemoryMap"){
      generateMemoryMapFiles(fct, s"../projects/${projectName.toLowerCase}/include")
    }
  }

  def generateMemoryMapFiles[T <: RawModule](fct: => T, path: String): Unit = {
    (new chisel3.stage.ChiselStage).emitVerilog({
      val module = fct
      module match {
        case core: BareCore =>
          core.generateLayoutFiles(path)
        case _ =>
          getCore(module).generateLayoutFiles(path)
      }
      scala.sys.exit(0)
      module
    })
  }
  def generateHardware[T <: RawModule](fct: => T, args: Array[String] = Array.empty): Unit = {
    print(args.mkString(","))
    (new chisel3.stage.ChiselStage).emitVerilog({
      val module = fct
      if(module.isInstanceOf[BareCore]) module.asInstanceOf[BareCore].connectCoreModules()
      module
    }, args)
  }

  private def getCore[T <: RawModule](m: T): BareCore = {
    val fields = (Seq[Any]() /: m.getClass.getDeclaredFields) { (a, f) =>
      try{
        f.setAccessible(true)
        a ++ Seq(f.get(m))
      }catch {
        case _ : Throwable => a
      }
    }

    val cores = fields.filter(p => p.isInstanceOf[BareCore]).map(_.asInstanceOf[BareCore]).toSeq
    if(cores.length > 1) throw new Exception("No more than one core allowed!")
    cores.head
  }
}
