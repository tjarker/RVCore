buildC:
ifdef f
	mkdir -p output/${f}
	riscv32-unknown-elf-gcc -g -ffreestanding -O0 -Wl,--gc-sections -nostartfiles -nostdlib -nodefaultlibs -Wl,-T,src/main/linker/rvcore.ld src/main/assembly/crt0.s -o output/${f}/${f}.o src/main/c/${f}.c
	riscv32-unknown-elf-objcopy output/${f}/${f}.o --dump-section .text=output/${f}/${f}.bin
	sbt 'runMain Top output/${f}/${f}.bin --target-dir output/${f}'
	riscv32-unknown-elf-objdump -d output/${f}/${f}.o
else
	@echo "Define the C file you want to build with `f=fileName.c`"
endif

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