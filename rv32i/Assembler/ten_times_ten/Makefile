PROGRAM_DIR := $(realpath $(dir $(firstword $(MAKEFILE_LIST))))
PROJECT_DIR := $(shell dirname $(shell dirname $(shell dirname $(shell dirname $(shell dirname $(PROGRAM_DIR))))))
PROJECT_NAME := $(notdir $(basename $(PROJECT_DIR)))

relative_path := $(patsubst $(PROJECT_DIR)%,%,$(PROGRAM_DIR))
relative_path := $(patsubst /%,%,$(relative_path))

include $(PROJECT_DIR)/config.properties

PROGRAM_NAME := $(PROGRAM_DIR)/ten_times_ten
DEPENDENCIES := $(PROGRAM_DIR)/../libs/math/INT_MULT.s

all: compile

compile:
	riscv32-unknown-elf-gcc -march=rv32i -mabi=ilp32 -nostdlib -Wl,-T,$(PROJECT_DIR)/$(GCC_LINKER) -o $(PROGRAM_NAME).elf $(PROGRAM_NAME).s $(DEPENDENCIES)
	riscv32-unknown-elf-objcopy -O binary $(PROGRAM_NAME).elf $(PROGRAM_NAME).bin
	hexdump -e '"%08x\n"' $(PROGRAM_NAME).bin | sed 's/../& /g' > $(PROGRAM_NAME).hex

dump:
	riscv32-unknown-elf-objdump -d $(PROGRAM_NAME).elf

clean:
	rm -f *.elf *.bin *.hex || true

docker-compile:
	docker run --rm -v $(PROJECT_DIR):/$(PROJECT_NAME) -w /$(PROJECT_NAME) rv32i-compiler make -f $(relative_path)/Makefile

