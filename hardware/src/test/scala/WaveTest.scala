import chisel3.iotesters.PeekPokeTester
import org.scalatest.{FlatSpec, Matchers}
import rvcore.RVCore
import rvcore.pipeline.RVPipline
import util.BinaryLoader



class WaveTester(dut: RVCore) extends PeekPokeTester(dut) {
  step(1000)
}

class WaveTest extends FlatSpec with Matchers {

  s"Top with waveforms" should "pass" in {
    chisel3.iotesters.Driver.execute(Array("--generate-vcd-output", "on"), () => new RVCore(BinaryLoader.loadProgramFromRes("loop"))) {
      c => new WaveTester(c) } should be(true)
  }
}

