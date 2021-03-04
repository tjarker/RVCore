package projects.typewriter

import rvcore.{CoreConstructor, RVCoreImpl}
import util.{CoreGenerator, Program}
import chisel3._

class TypeWriter extends Module {
  val io = IO(new Bundle{

  })

  val core = Module(CoreGenerator(new TypeWriterCore))

}
object TypeWriter extends App {
  chisel3.Driver.execute(Array("--target-dir","../output/blink2"),() => new TypeWriter)
}