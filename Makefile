
f ?= None
o ?= out.bin

libDir ?= lib
INCLUDELIB = `find $(libDir) -type d | sed s/^/-I/` # note the (`) backquotes
LinkLib = `find $(libDir) -type d | sed s/^/-L/` # note the (`) backquotes

dump:
	riscv32-unknown-elf-objdump -d $(f)
	

comp:
ifdef f
	mkdir -p output
	riscv32-unknown-elf-gcc -g $(INCLUDELIB) $(LinkLib) -ffreestanding -O1 -Wl,--gc-sections -nostartfiles -nostdlib -nodefaultlibs -Wl,-T,lib/new.ld lib/crt0.s -o output/a.o $(f)
	riscv32-unknown-elf-objcopy output/a.o --dump-section .text=$(f)
else
	@echo "comp target needs file parameter `f`"
endif

asm:
ifdef f
	riscv32-unknown-elf-as -o output/a.o ${f}
	riscv32-unknown-elf-objcopy output/a.o --dump-section .text=${o}
else
	@echo "asm target needs file parameter `f`"
endif

testPipeline:
	cd hardware; sbt 'testOnly rvcore.*'



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

newProject:
ifdef name 
	mkdir projects/$(name)
	cp -r projects/template/* projects/$(name)
	rm -r projects/$(name)/output
	mv projects/$(name)/synthesis/rvbasys3.xpr projects/$(name)/synthesis/$(name).xpr
else
	@echo "Specify a `name` for the new project!"
endif