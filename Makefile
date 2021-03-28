
project ?= template
outdir ?= projects/$(project)/output/
f ?= None
o ?= None

dump:
	riscv32-unknown-elf-objdump -d output/$(f)/$(f).o
	riscv32-unknown-elf-objdump -d output/$(f)/$(f).o
	

comp:
	mkdir -p $(outdir)
	riscv32-unknown-elf-gcc -g -ffreestanding -O0 -Wl,--gc-sections -nostartfiles -nostdlib -nodefaultlibs -Wl,-T,lib/new.ld lib/crt0.s -Iprojects/$(project)/include -o $(outdir)/$(project).o projects/$(project)/src/main.c
	riscv32-unknown-elf-objcopy $(outdir)/$(project).o --dump-section .text=$(outdir)/$(project).bin

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
	cd hardware; sbt test

#########################################################################################################################
# FPGA 

synth:
	vivado -mode batch -source hardware/synthesis/synth.tcl

program:
	vivado -mode batch -source hardware/synthesis/config.tcl



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


#########################################################################################################################
# documentation

doc:
	xvfb-run -a drawio --export --format png --output docs/images/ docs/schematics/ --disable-gpu --headless --no-sandbox
	#drawio -x -f png -o docs/images/ docs/schematics/

#########################################################################################################################
# setup

setup:
	cd scripts; ./install_drawio.sh