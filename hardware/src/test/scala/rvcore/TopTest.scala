package rvcore


import chiseltest._
import org.scalatest.FreeSpec
import chisel3._
import rvcore.pipeline.RVPipeline
/*
private object tester {
  def testProgram(dut: RVPipline, program: Program) : Unit = {
    dut.clock.setTimeout(10000)
    while(dut.io.instr.peek.litValue() != 0x00000073) dut.clock.step(1)
    dut.clock.step(5)
    println(program.toString+"\nSimulated regfile state:\n"+
      Seq.tabulate(32)(i => "%3s=0x%08x".format(s"x$i",dut.io.regFilePort.get(i).peek.litValue.toInt)).sliding(4,4).map(_.mkString("\t\t\t")).mkString("\n")+s"\n${"="*94}")
    for(i <- 0 until 32){
      dut.io.regFilePort.get(i).expect(program.results(i).S)
    }
  }
}


class TestAll extends FreeSpec with ChiselScalatestTester {

  val programs = BinaryLoader.loadAllPrograms()

  for(program <- programs){
    s"${program.name} should pass" in {
      test(new RVPipline(program.byteBinaries)) { c =>
        val wrapper = new RVPipedSimWrapper(c, program)
        wrapper.run()
      }
    }
  }
}

class TestSingle extends FreeSpec with ChiselScalatestTester {

  val program = BinaryLoader.loadProgramFromRes("loop")

  s"${program.name} should pass" in {
    test(new RVPipline(program.byteBinaries)) { c =>
      val wrapper = new RVPipedSimWrapper(c, program)
      wrapper.run()
    }
  }
}

*/