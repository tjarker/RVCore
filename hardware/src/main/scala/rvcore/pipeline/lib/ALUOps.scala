package rvcore.pipeline.lib

import chisel3.util.Enum

object ALUOps {
  val add :: sub :: sl :: sr :: sra :: and :: or :: xor :: slt :: Nil = Enum(9)
}
