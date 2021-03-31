import chiseltest._
import chiseltest.experimental.TestOptionBuilder.ChiselScalatestOptionBuilder
import chiseltest.internal.WriteVcdAnnotation
import org.scalatest._
import util.Test


class VGATest extends FreeSpec with ChiselScalatestTester{
  "Generated_wavforms_VGA" in {
    test(new Test).withAnnotations(Seq(WriteVcdAnnotation)){ dut =>
      dut.clock.setTimeout(0)
      dut.clock.step(2000000)
    }
  }
}

