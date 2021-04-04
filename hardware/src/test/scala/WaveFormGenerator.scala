import chiseltest._
import chiseltest.experimental.TestOptionBuilder.ChiselScalatestOptionBuilder
import chiseltest.internal.{VerilatorBackendAnnotation, WriteVcdAnnotation}
import org.scalatest._
import projects.template.Template
import rvcore.util.Constructor



class WaveFormGenerator extends FreeSpec with ChiselScalatestTester{
  "Generated_wavforms" in {
    test(Constructor(new Template)).withFlags(Array("--target-dir", "../projects/template/output")).withAnnotations(Seq(WriteVcdAnnotation)){ dut =>
      dut.clock.setTimeout(0)
      dut.clock.step(1000)
    }
  }
}
