package rvcore.simulation

import rvcore.RVCore
import rvcore.lib.{BinaryDumper, Program}
import chiseltest._
import chisel3._
import rvcore.lib.OpcodesRV32I._


class RVPipedSimWrapper(dut: RVCore, program: Program, printRes : Boolean = true) {

  // simulates the processor until a finishing exit ecall occurs
  def run(): Int = {

    // no run time restriction
    dut.clock.setTimeout(5000)

    // setup simulation vars
    var running = true
    val output = new StringBuilder
    var cycles = 0
    var ret = 0
    var ecallPipe = Seq.fill(5)(false)

    // simulation loop
    while (running) {

      dut.clock.step(1)

      // an ecall occured 5 cycles ago
      if (ecallPipe.head) {
        // fetch argument registers
        val a0 = dut.io.regFilePort.get(10).peek.litValue.toInt
        val a1 = dut.io.regFilePort.get(11).peek.litValue.toInt

        // decode type of ecall
        a0 match {
          case 1 => output.append(s"$cycles: $a1\n")
          case 10 => running = false
          case 11 => output.append("%d: %c\n".format(cycles,a1.toChar))
          case 17 =>
            running = false
            ret = a1
          case _ => output.append(s"$cycles: ecall '$a0' not supported\n")
        }
      }
      // let ecalls bubble through the delay pipe
      ecallPipe = Seq.tabulate(5)(i => if (i == 4) dut.io.instr.peek.litValue == ECALL.opcode.litValue else ecallPipe(i + 1))

      cycles += 1
    }
    BinaryDumper.BinaryDump(regFileToSeq,s"test_run_dir/${program.name}_piped_dump.bin")
    // print report
    if(printRes) println(s"${"=" * 39}Pipelined Model${"=" * 40}${program.toString}\nProgram execution stopped after $cycles cycles\n${"-" * 94}\nSimulated regfile state:\n$regFileToString ${if (output.nonEmpty) s"\n${"-" * 94}\nOutput:\n$output" else ""}\n${"=" * 94}")
    return cycles
  }

  def regFileToString: String = {
    Seq.tabulate(32)(i => "%3s=0x%08x".format(s"x$i", dut.io.regFilePort.get(i).peek.litValue.toInt)).sliding(4, 4).map(_.mkString("\t\t")).mkString("\n")
  }
  def regFileToSeq: Seq[Int] = {
    Seq.tabulate(32)(i => dut.io.regFilePort.get(i).peek.litValue.toInt)
  }
}
