
# ------------------------------------------------------------------------------------------- #
# Standard Discovery for finding where the program
# ------------------------------------------------------------------------------------------- #

# Find the config.properties in the home directory
# if it is not there it will eventually Segmentation fault
define find_config_file
$(if $(wildcard $(1)/config.properties),$(1)/config.properties,$(call find_config_file,$(1)/..))
endef

CONFIG_FILE := $(call find_config_file,.)

ifeq ($(CONFIG_FILE),)
$(error Config file not found in any parent directory)
endif

CONFIG_FILE := $(subst $(CURDIR)/,,$(realpath $(CONFIG_FILE)))

# Project Relative Path and Program Relative Path 
PROJECT_DIR := $(patsubst %/,%,$(dir $(CONFIG_FILE)))
PROGRAM_DIR := $(realpath $(dir $(firstword $(MAKEFILE_LIST))))
PATH_FROM_PROJECT_TO_PROGRAM := $(patsubst /%,%,$(patsubst $(PROJECT_DIR)%,%,$(PROGRAM_DIR)))

PROJECT_NAME := $(notdir $(basename $(PROJECT_DIR)))

# ------------------------------------------------------------------------------------------- #

# ------------------------------------------------------------------------------------------- #

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
	docker run --rm -v $(PROJECT_DIR):/$(PROJECT_NAME) -w /$(PROJECT_NAME) rv32i-compiler make -f $(PATH_FROM_PROJECT_TO_PROGRAM)/Makefile

