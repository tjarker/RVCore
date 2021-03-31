package rvcore.memory

import chisel3._
import chisel3.util.HasBlackBoxInline
import rvcore.util.Program

class RealROM(program: Program) extends BlackBox with HasBlackBoxInline {
  val io = IO(new Bundle{
    val addr = Input(UInt(32.W))
    val data = Output(UInt(32.W))
  })

  val sb = new StringBuilder

  val romStr = program.wordBinaries.zipWithIndex.map { case (data,index) =>
    s"\t\t31'h%08X: data <= 32'h%08X;".format(index,data)
  }.mkString("\n")


  setInline("RealROM.v",
    s"""
       |module RealROM(
       |    input clock,
       |    input [31:0] addr,
       |    output reg [31:0] data
       |);
       |reg [29:0] addrReg;
       |
       |always @(posedge clock) begin
       |  addrReg <= addr[31:2];
       |end
       |
       |always @(addrReg) begin
       |  case(addrReg)
       |$romStr
       |  endcase
       |end
       |
       |endmodule
       |""".stripMargin
  )
}