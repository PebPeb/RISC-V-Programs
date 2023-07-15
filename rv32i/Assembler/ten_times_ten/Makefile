include ../../../../../config.properties

PROGRAM_NAME = ten_times_ten
DEPENDENCIES = ../libs/math/INT_MULT.s

all: compile

compile:
	riscv32-unknown-elf-gcc -march=rv32i -mabi=ilp32 -nostdlib -Wl,-T,../../../../../$(GCC_LINKER) -o $(PROGRAM_NAME).elf $(PROGRAM_NAME).s $(DEPENDENCIES)
	riscv32-unknown-elf-objcopy -O binary $(PROGRAM_NAME).elf $(PROGRAM_NAME).bin
	hexdump -e '"%08x\n"' $(PROGRAM_NAME).bin | sed 's/../& /g' > $(PROGRAM_NAME).hex

dump:
	riscv32-unknown-elf-objdump -d $(PROGRAM_NAME).elf

clean:
	rm -f *.elf *.bin *.hex || true

