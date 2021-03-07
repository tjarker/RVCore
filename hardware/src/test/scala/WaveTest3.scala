import chisel3.iotesters.PeekPokeTester
import org.scalatest.{FlatSpec, Matchers}
import projects.template.Template
import rvcore.memory.RAM
import rvcore.pipeline.RVPipeline
import rvcore.util.{BinaryLoader, Constructor}
import trash.RVCoreImpl


class WaveTester3(dut: RAM) extends PeekPokeTester(dut) {
  step(1000)
}

class WaveTest3 extends FlatSpec with Matchers {

  s"Top with waveforms" should "pass" in {
    chisel3.iotesters.Driver.execute(Array("--generate-vcd-output", "on","--target-dir","../projects/template/output"), () => new RAM("hello",0x1000,4096)) {
      c => new WaveTester3(c) } should be(true)
  }
}