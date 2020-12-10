package rvcore.submodules

import chisel3._
import chisel3.util._

abstract class BranchPredictor extends Module{
  val io = IO(new Bundle{
    val pc = Input(UInt(32.W))
    val newPc = Input(UInt(32.W))
    val pcSrc = Input(Bool())
    val index = Input(UInt(8.W))
    val takeBranchEx = Input(Bool())
    val takeBranchGuess = Output(Bool())
  })

}

class BranchGen extends Module{
  val io = IO(new Bundle{
    val pc = Input(UInt(32.W))
    val instruction = Input(SInt(32.W))
    val newPc = Output(UInt(32.W))
  })
  io.newPc := (io.pc.asSInt() + Cat(io.instruction(31), io.instruction(7), io.instruction(30, 25), io.instruction(11, 8), 0.U(1.W)).asSInt).asUInt
}

class BranchPredictorAlwaysTaken extends BranchPredictor{
  io.takeBranchGuess := true.B
}

class BranchPredictorNeverTaken extends BranchPredictor{
  io.takeBranchGuess := false.B
}

class BranchPredictorLoopcheck extends BranchPredictor{
  io.takeBranchGuess := io.pc > io.newPc
}

class BranchPredictorIndex1 extends BranchPredictor {

  val table = RegInit(VecInit(Seq.fill(Math.pow(2,8).toInt)(false.B)))
  val guessIndex = io.pc(7,0)

  io.takeBranchGuess := table(guessIndex)
  when(io.pcSrc){
    table(io.index) := io.takeBranchEx
  }
}

class BranchPredictorIndex2 extends BranchPredictor {

  val notTaken0 :: notTaken1 :: taken0 :: taken1 :: Nil = Enum(4)
  val table = RegInit(VecInit(Seq.fill(Math.pow(2,8).toInt)(notTaken0)))
  val guessIndex = io.pc(7,0)
  val indexedFSMGuess = table(guessIndex)
  val indexedFSMEx = table(io.index)

  io.takeBranchGuess := false.B

  switch(indexedFSMGuess){
    is(notTaken0){
      io.takeBranchGuess := false.B
    }
    is(notTaken1){
      io.takeBranchGuess := false.B
    }
    is(taken0){
      io.takeBranchGuess := true.B
    }
    is(taken1){
      io.takeBranchGuess := true.B
    }
  }
  switch(indexedFSMEx){
    is(notTaken0){
      when(io.pcSrc){
        indexedFSMEx := notTaken0
        when(io.takeBranchEx){
          indexedFSMEx := notTaken1
        }
      }
    }
    is(notTaken1){
      when(io.pcSrc){
        indexedFSMEx := notTaken0
        when(io.takeBranchEx){
          indexedFSMEx := taken0
        }
      }
    }
    is(taken0){
      when(io.pcSrc){
        indexedFSMEx := notTaken1
        when(io.takeBranchEx){
          indexedFSMEx := taken1
        }
      }
    }
    is(taken1){
      when(io.pcSrc){
        indexedFSMEx := taken0
        when(io.takeBranchEx){
          indexedFSMEx := taken1
        }
      }
    }
  }
}


