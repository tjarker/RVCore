# RVCore

[![status](https://github.com/tjarker/RVCore/workflows/CI/badge.svg)](https://github.com/tjarker/RVCore/actions)

A Risc-V Processor targeting the [Basys 3](https://reference.digilentinc.com/reference/programmable-logic/basys-3/reference-manual) FPGA board.


# TODO

## Hardware
### Design
- Pipeline:
    - [ ] add super class `pipelineStage`
    - [ ] add wait for memory response
- Essential Core devices:
    - [ ] ROM
    - [x] RAM
    - [ ] Timer
    - [ ] CPUInfo
    - [ ] Programmable Interrupt Controller
    - [ ] UART
    - [ ] Bus Extender
- Peripheral Devices:
    - [ ] PS2 Keyboard Controller
    - [ ] VGA Text Controller
    - [ ] GPIO Controller
    - [ ] Seven Segment Controller
- Others:
    - [ ] QSPI Controller
    - [ ] XADC Controller
### Testing
- Pipeline:
    - [ ] Create lightweight RV32I simulator
    - [ ] Create simple test environment with CoSim
    - [ ] Create random instruction generator to test
- Bus Device:
    - [ ] Create unified SysBus test system
    - [ ] Create compliance test, applicable to all SysBus devices

## Software
### Compilation and Linking
- Unified memory mapping system:
    - [ ] create header file with address definitions from Top file
    - [ ] create linker script from address definitions from Top file
    - [ ] create xdc file?
- Building Automation:
    - [ ] Extend Make functionality to include whole build process
- Standard Library:
    - [ ] Provide implementation of basic functions
- Device Library:
    - [ ] Provide HAL for devices
