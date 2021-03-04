import chisel3.iotesters.PeekPokeTester
import org.scalatest.{FlatSpec, Matchers}
import rvcore.RVCoreImpl
import rvcore.pipeline.RVPipeline
import util.BinaryLoader



class WaveTester(dut: RVCoreImpl) extends PeekPokeTester(dut) {
  step(1000)
}

class WaveTest extends FlatSpec with Matchers {

  s"Top with waveforms" should "pass" in {
    chisel3.iotesters.Driver.execute(Array("--generate-vcd-output", "on"), () => new RVCoreImpl(BinaryLoader.loadProgramFromRes("loop"))) {
      c => new WaveTester(c) } should be(true)
  }
}

