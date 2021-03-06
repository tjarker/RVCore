package rvcore

import rvcore.util.CoreConstructor

object CoreCLI extends App {
  if(args.length == 0) throw new Exception("Needs parameters")



  val cmd = args.head
  val core = args(1)
  var argMap = args.slice(2,args.length).grouped(2).map(a => (a(0),a(1))).toMap
  if(!argMap.contains("--target-dir")) argMap = argMap ++ Map("--target-dir" -> "../output/")

  println(argMap)

  if(cmd == "build"){
    CoreConstructor.generateHardware(() => {
      Class.forName(s"projects.${core}").getDeclaredConstructor().newInstance().asInstanceOf[BareCore]
    },argMap)
  }else if(cmd == "generateHeader"){
    CoreConstructor.generateHeaderFiles(() => {
      Class.forName(s"projects.${core}").getDeclaredConstructor().newInstance().asInstanceOf[BareCore]
    },argMap)
  }
}
