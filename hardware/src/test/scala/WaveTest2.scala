import chisel3.iotesters.PeekPokeTester
import org.scalatest.{FlatSpec, Matchers}
import projects.template.Template
import rvcore.pipeline.RVPipeline
import rvcore.util.{BinaryLoader, Constructor}
import trash.RVCoreImpl


class WaveTester2(dut: Template) extends PeekPokeTester(dut) {
  step(1000)
}

class WaveTest2 extends FlatSpec with Matchers {

  s"Top with waveforms" should "pass" in {
    chisel3.iotesters.Driver.execute(Array("--generate-vcd-output", "on","--target-dir","../projects/template/output"), () => Constructor(new Template)) {
      c => new WaveTester2(c) } should be(true)
  }
}

