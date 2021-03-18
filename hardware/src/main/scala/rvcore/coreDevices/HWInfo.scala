package rvcore.coreDevices

import rvcore.systembus.RegBusModule

class HWInfo(refName: String, baseAddr: Int) extends RegBusModule("hwinfo_t",refName,baseAddr,2){

}
