package rvcore.util

import java.io.{File, FileOutputStream, IOException}
import java.nio.file.{Files, Paths}

class Program(n: String, bin: Array[Int], len: Int) {
  val name = n
  val byteBinaries = bin
  val wordBinaries = bin.map(BigInt(_)).sliding(4, 4).map(a => a(3) << 24 | a(2) << 16 | a(1) << 8 | a(0)).toArray
  val length = len
}


object BinaryLoader {
  def loadBin(path: String): (Array[Int], Int) = {
    val bytes = Files.readAllBytes(Paths.get(path)).map(_ & 0xFF).sliding(4, 4).toArray
    if (bytes(bytes.length - 1).length < 4) bytes(bytes.length - 1) = Array(0, 0, 0, 0)
    (Array.concat(bytes.flatten, Array.fill(16)(0)), bytes.flatten.length / 4)
  }

  def getListOfFiles(dir: String): List[String] = {
    val d = new File(dir)
    if (d.exists && d.isDirectory) {
      d.listFiles.filter(_.isFile).toList.map(_.getName).map(a => a.substring(0, a.length - 4)).distinct
    } else {
      List[String]()
    }
  }

  def loadProgram(path: String): Program = {
    val (bin, length) = loadBin(path)
    val split = path.split(Array('/', '\\'))
    val name = split(split.length - 1)
    new Program(name.substring(0, name.length - 4), bin, length)
  }

  def loadProgramFromRes(name: String): Program = {
    val (bin, length) = loadBin(s"src/main/resources/test_lib_bin/$name.bin")
    new Program(name, bin, length)
  }

  def loadAllPrograms(): Seq[Program] = {
    getListOfFiles("src/main/resources/test_lib_bin").map(loadProgramFromRes)
  }

  def main(args: Array[String]): Unit = {
    println(getListOfFiles("src/main/resources/test_lib_bin").mkString(", "))
    println(loadAllPrograms().map(_.toString).mkString("\n"))
  }
}

