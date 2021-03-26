hardwareDir ?= ../../hardware
libDir 		?= ../../lib
projectName ?= Template

INCLUDELIB = `find $(libDir) -type d | sed s/^/-I/` # note the (`) backquotes
LinkLib = `find $(libDir) -type d | sed s/^/-L/` # note the (`) backquotes


dump:
	riscv32-unknown-elf-objdump -d output/$(projectName).o

comp:
	mkdir -p output
	riscv32-unknown-elf-gcc $(INCLUDELIB) -I./include/ $(LinkLib) -v -g -ffreestanding -O0 -Wl,--gc-sections -nostartfiles -nostdlib -nodefaultlibs -Wl,-T,$(libDir)/new.ld $(libDir)/crt0.s  -o output/$(projectName).o src/main.cpp
	riscv32-unknown-elf-objcopy output/$(projectName).o --dump-section .text=output/$(projectName).bin

genIncludes:
	cd hardware && sbt 'run generateHeader $(project)'

gen:
	cd hardware && sbt 'run build $(project)'

asm:
	riscv32-unknown-elf-as -o ${f}.o ${f}.s
	riscv32-unknown-elf-objcopy ${f}.o --dump-section .text=${f}.bin

buildAsm:
ifdef f
	mkdir -p output/${f}
	riscv32-unknown-elf-as -o output/${f}/${f}.o src/main/assembly/${f}.s
	riscv32-unknown-elf-objcopy output/${f}/${f}.o --dump-section .text=output/${f}/${f}.bin
	sbt 'runMain Top output/${f}/${f}.bin --target-dir output/${f}'
	riscv32-unknown-elf-objdump -d output/${f}/${f}.o
else
	@echo "Define the C file you want to build with `f=fileName.s`"
endif

test:
	cd $(hardwareDir); sbt test

#########################################################################################################################
# FPGA 

synth:
	vivado -mode batch -source synthesis/synth.tcl

program:
	vivado -mode batch -source synthesis/config.tcl



getFunctionAddr:
	ifdef func
	ifdef f 
		$(eval ADDR=$(shell sh -c "riscv32-unknown-elf-objdump output/${f}/${f}.o -t | grep ${func} |cut -d ' ' -f 1"))
		@echo 'address = ${ADDR}'
	else
		@echo 'define a object file with `f=object.o`'
	endif
	else 
		@echo 'define a function with `func=function`'
	endif