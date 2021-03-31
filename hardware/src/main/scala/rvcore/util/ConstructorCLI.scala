package rvcore.util

import chisel3.RawModule

import java.io.File



object ConstructorCLI extends App {

  if (args.length == 0) throw new Exception("Needs parameters")

  val cmd = args.head
  val projectName = args(1)
  var argVec = args.slice(2, args.length)

  Constructor.run(projectName,Class.forName(s"projects.${projectName.toLowerCase}.${findMatch(projectName)}").getDeclaredConstructor().newInstance().asInstanceOf[RawModule], cmd, argVec)

  def findMatch(project: String): String = {
    println(new java.io.File(".").getCanonicalPath)
    val d = new File(s"src/main/scala/projects/${project.toLowerCase}")
    if (d.exists && d.isDirectory) {
      d.listFiles.filter(_.isFile).toList.map(_.toString.split('/').last.split('.').head).filter(_.toLowerCase == project.toLowerCase).head
    } else {
      throw new Exception("No match found for the defined project name!")
      ""
    }
  }
}
