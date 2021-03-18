package util

import java.io.{FileOutputStream, IOException}

object BinaryDumper {

  def BinaryDump(regFile: Seq[Int], fileName: String) = {

    var out = None: Option[FileOutputStream]

    try {
      out = Some(new FileOutputStream(fileName))
      for (element <- regFile) {
        for (i <- 2 :: 3 :: 0 :: 1 :: Nil) {
          out.get.write((element >> i * 8) & 0xFF)
        }
      }
    } catch {
      case e: IOException => e.printStackTrace
    } finally {
      if (out.isDefined) out.get.close
    }
  }
}