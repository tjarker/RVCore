# RVCore
A Risc-V Processor targeting the [Basys 3](https://reference.digilentinc.com/reference/programmable-logic/basys-3/reference-manual) FPGA board.

Generate *Verilog* hardware description with *C* source code located `src/main/c/`:
```
make f=filename buildC
```

Generate *Verilog* hardware description with assembly source code located `src/main/assembly/`:
```
make f=filename buildAsm
```