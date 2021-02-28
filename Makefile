
outdir?= $(CURDIR)/output
cdir?= $(CURDIR)/software/src/main/C
asmdir?= $(CURDIR)/software/src/main/asm
res?= $(CURDIR)/software/src/main/resources

f?= blink2

dump:
	riscv32-unknown-elf-objdump -d output/$(f)/$(f).o
	riscv32-unknown-elf-objdump -d output/$(f)/$(f).o
	

comp:
	mkdir -p $(outdir)/$(f)
	riscv32-unknown-elf-gcc -g -ffreestanding -O0 -Wl,--gc-sections -nostartfiles -nostdlib -nodefaultlibs -Wl,-T,$(res)/new.ld $(res)/crt0.s -o $(outdir)/$(f)/$(f).o $(cdir)/$(f).c
	riscv32-unknown-elf-objcopy $(outdir)/$(f)/$(f).o --dump-section .text=$(outdir)/$(f)/$(f).bin
gen:
	sbt 'runMain Top output/${f}/${f}.bin --target-dir output/${f}'



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
	cd hardware
	sbt test

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