package rvcore.pipeline

import chiseltest._
import rvcore.lib.OpcodesRV32I.ECALL
import rvcore.systembus.SysBusCmd
import util.SimMemory
import chisel3._
import rvcore.util.Program

class PipelineSimWrapper(dut: RVPipeline, program: Program, memorySize: Int){

  val mem = new SimMemory(memorySize, program.wordBinaries)
  //mem.printMem(program.wordBinaries.length)

  // simulates the processor until a finishing exit ecall occurs
  def run(): Int = {

    // no run time restriction
    dut.clock.setTimeout(5000)

    // setup simulation vars
    var running = true
    val output = new StringBuilder
    var cycles = 0
    var ret = 0
    var ecallPipe = Seq.fill(4)(false)

    // simulation loop
    while (running) {

      val pc = dut.io.instrBus.pc.peek.litValue()
      val instr = mem.readWord(pc)
      //println(s"pc = %H, instr = %H".format(pc,instr))
      dut.io.instrBus.instr.poke(instr.U)

      val cmd = dut.io.sysBusIO.m.cmd.peek.litValue()
      val addr = dut.io.sysBusIO.m.addr.peek.litValue()
      val wrData = dut.io.sysBusIO.m.wrData.peek.litValue()
      val strobe = dut.io.sysBusIO.m.strb.map(_.peek.litToBoolean).toSeq

      if(cmd == SysBusCmd.WRITE.litValue().toInt){
        //println("Mem[%H] := %H".format(addr,wrData))
        mem.writeWord(addr,wrData,strobe)
      }

      dut.clock.step(1)

      if(cmd == SysBusCmd.READ.litValue().toInt){
        val read = mem.readWord(addr)
        //println("Mem[%H] = %H".format(addr,read))
        dut.io.sysBusIO.s.rdData.poke(read.U)
      }

      // an ecall occured 5 cycles ago
      if (ecallPipe.head) {
        // fetch argument registers
        val a0 = dut.io.debugPort.get.regfile(10).peek.litValue.toInt
        val a1 = dut.io.debugPort.get.regfile(11).peek.litValue.toInt

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
      ecallPipe = Seq.tabulate(4)(i => if (i == 3) dut.io.debugPort.get.instr.peek.litValue == ECALL.opcode.litValue else ecallPipe(i + 1))

      cycles += 1
    }
    return cycles
  }

  def regFileToString: String = {
    Seq.tabulate(32)(i => "%3s = %10s".format(s"x$i", "0x%02X".format(dut.io.debugPort.get.regfile(i).peek.litValue.toInt))).sliding(4, 4).map(_.mkString("  |  ")).mkString("\n")
  }
  def regFileToSeq: Seq[Int] = {
    Seq.tabulate(32)(i => dut.io.debugPort.get.regfile(i).peek.litValue.toInt)
  }
}
