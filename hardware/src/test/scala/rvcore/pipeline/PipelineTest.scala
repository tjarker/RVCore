package rvcore.pipeline

import util.BinaryLoader
import chiseltest._
import org.scalatest.FreeSpec
import chisel3._
import rvcore.pipeline.emulator.{RVEmulator, RVEmulatorSimWrapper}


class AllPrograms extends FreeSpec with ChiselScalatestTester{

  val programs = BinaryLoader.loadAllPrograms()
  val memorySize = 0x200000

  for(program <- programs) {

    s"RVPipeline Test ${program.name}" in {

      var emulated: Seq[BigInt] = Seq()

      val output = new StringBuilder
      output.append(s"${"=" * 31}RVPipeline Tester${"=" * 31}\n")
      output.append(s"Program name: ${program.name}\n${"-" * 79}\n")

      test(new RVEmulator(program.byteBinaries, memorySize)) { c =>
        val wrapper = new RVEmulatorSimWrapper(c, program)
        wrapper.run()
        output.append(s"Emulator Regfile:\n${wrapper.regFileToString}\n${"-" * 79}\n")
        emulated = wrapper.regFileToSeq
      }

      test(new RVPipeline(sim = true)) { c =>
        val wrapper = new PipelineSimWrapper(c, program, memorySize)
        wrapper.run()
        for (i <- 0 until 32) {
          c.io.debugPort.get.regfile(i).expect(emulated(i).asUInt(32.W),s"Cause: x$i = 0x${c.io.debugPort.get.regfile(i).peek.litValue.toString(16)} instead of x$i = 0x${emulated(i).toString(16)}")
        }
        output.append(s"RVPipeline Regfile:\n${wrapper.regFileToString}\n${"=" * 79}")
        println(output)
      }
    }

  }
}