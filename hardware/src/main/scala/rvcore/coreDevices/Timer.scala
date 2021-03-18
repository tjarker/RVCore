package rvcore.coreDevices

import rvcore.systembus.RegBusModule

class Timer(refName: String, baseAddr: Int) extends RegBusModule("timer_t",refName,baseAddr,2){

}
