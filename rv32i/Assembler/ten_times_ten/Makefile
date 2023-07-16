HOME_DIR = ../../../../../
PROGRAM_DIR = $(CURDIR)

include $(HOME_DIR)config.properties

PROGRAM_NAME = ten_times_ten
DEPENDENCIES = ../libs/math/INT_MULT.s

all: compile

compile:
	echo $(PROGRAM_DIR)
	riscv32-unknown-elf-gcc -march=rv32i -mabi=ilp32 -nostdlib -Wl,-T,../../../../../$(GCC_LINKER) -o $(PROGRAM_NAME).elf $(PROGRAM_NAME).s $(DEPENDENCIES)
	riscv32-unknown-elf-objcopy -O binary $(PROGRAM_NAME).elf $(PROGRAM_NAME).bin
	hexdump -e '"%08x\n"' $(PROGRAM_NAME).bin | sed 's/../& /g' > $(PROGRAM_NAME).hex

dump:
	riscv32-unknown-elf-objdump -d $(PROGRAM_NAME).elf

clean:
	rm -f *.elf *.bin *.hex || true

docker-compile:
	
	docker run --rm -v ../../../../../:/project -w /project rv32i-compiler make -f /project/programs/RISC-V-Programs/rv32i/Assembler/ten_times_ten/Makefile


