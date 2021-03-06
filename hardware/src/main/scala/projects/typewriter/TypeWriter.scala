package projects.typewriter

import chisel3._
import rvcore.util.CoreConstructor

class TypeWriter extends Module {
  val io = IO(new Bundle{

  })

  val core = Module(CoreConstructor(new TypeWriterCore))

}
object TypeWriter extends App {
  chisel3.Driver.execute(Array("--target-dir","../output/blink2"),() => new TypeWriter)
}