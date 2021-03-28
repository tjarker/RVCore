hardwareDir ?= ../../hardware
libDir 		?= ../../lib
projectName ?= $(lastword $(subst /, ,$(CURDIR)))
f 			?= src/main.cpp
objcopy		?= $(projectName)

INCLUDELIB = `find $(libDir) -type d | sed s/^/-I/` # note the (`) backquotes
LinkLib = `find $(libDir) -type d | sed s/^/-L/` # note the (`) backquotes

#########################################################################################################################
# build

all: build synth program

build: memmap comp gen

time:
	$(eval t1 = $(shell date +%s))
	@sleep 5
	$(eval t2 = $(shell date +%s))
	@echo $(t1)
	@echo $(t2)
	@echo $(shell expr $(t2) - $(t1) )


#########################################################################################################################
# Hardware

memmap:
	cd $(hardwareDir) && sbt 'run genMemoryMap $(projectName)'

gen:
	cd $(hardwareDir) && sbt 'run build $(projectName)'

test:
	cd $(hardwareDir); sbt test

#########################################################################################################################
# Compiling

comp:
	mkdir -p output
	riscv32-unknown-elf-gcc $(INCLUDELIB) -I./include/ $(LinkLib) -v -g -ffreestanding -O0 -Wl,--gc-sections -nostartfiles -nostdlib -nodefaultlibs -Wl,-T,$(libDir)/new.ld $(libDir)/crt0.s  -o output/$(o).o $(f)
	riscv32-unknown-elf-objcopy output/$(projectName).o --dump-section .text=output/$(o).bin

asm:
	riscv32-unknown-elf-as -o ${f}.o ${f}.s
	riscv32-unknown-elf-objcopy ${f}.o --dump-section .text=${f}.bin

dump:
	riscv32-unknown-elf-objdump -d output/$(projectName).o

#########################################################################################################################
# FPGA 

synth:
	vivado -mode batch -tempDir output -journal output/vivado.jou -log output/vivado.log -source synthesis/synth.tcl

program:
	vivado -mode batch -tempDir output -journal output/vivado.jou -log output/vivado.log -source synthesis/config.tcl

#########################################################################################################################

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