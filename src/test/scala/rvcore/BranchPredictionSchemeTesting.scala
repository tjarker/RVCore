package rvcore

import rvcore.RVCore
import rvcore.lib.BinaryLoader
import rvcore._
import chiseltest._
import org.scalatest._
import rvcore.simulation.RVPipedSimWrapper

class BranchPredictionSchemeTesting extends FreeSpec with ChiselScalatestTester{

  val predictionSchemes = List("Always", "Never", "Loop", "Index1", "Index2")
  val program = BinaryLoader.loadProgramFromRes("loop")
  val cycles = new Array[Int](predictionSchemes.size)
  var i = 0

  s"${program.name} should pass co-simulation" in {
    for(predictionScheme <- predictionSchemes){
      test(new RVCore(program.byteBinaries, predictionScheme)){ c =>
        val wrapper = new RVPipedSimWrapper(c, program, false
        )
        cycles(i) = wrapper.run()
        i += 1
      }
    }

    println(s"${"=" * 16 + "=" * 20 * cycles.length}\n\nScheme:${"\t" * 3}${predictionSchemes.mkString(s"${"\t" * 2}-${"\t" * 2}")}\nCycles:${"\t" * 3}${cycles.mkString(s"${"\t" * 2}-${"\t" * 2}")}\nPerformance\t\t${cycles.map((x : Int) => "%.2f%c".format(100 * cycles.max/x.toDouble,'%')).mkString(s"${"\t" * 2}-${"\t" * 2}")}\nBest:${"\t" * 3}${predictionSchemes(cycles.indexOf(cycles.min))}\nWorst:${"\t" * 3}${predictionSchemes(cycles.indexOf(cycles.max))}\n\n${"=" * 16 + "=" * 20 * cycles.length}")
  }
}
