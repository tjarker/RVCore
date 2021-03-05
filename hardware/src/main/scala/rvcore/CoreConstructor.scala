package rvcore

class CoreConstructor[T <: BareCore](fct: () => T) extends App{
  if(args.length == 1 || (args.length > 1 && args(0) == "build")) {
    generateHardware(fct,
      Array("--target-dir","../output/blink2")
    )
  } else {
    generateHeaderFiles(fct,
      Array("--target-dir","../output/blink2")
    )
  }
  def generateHeaderFiles[T <: BareCore](fct: () => T, conf: Array[String] = null): Unit = {
    chisel3.Driver.execute(conf,() => {
      val a: BareCore = fct()
      a.generateHeader()
      sys.exit(0)
      a
    })
  }
  def generateHardware[T <: BareCore](fct: () => T, conf: Array[String] = null): Unit = {
    chisel3.Driver.execute(conf,() => {
      val a: BareCore = fct()
      a.connectCoreModules()
      a
    })
  }
}