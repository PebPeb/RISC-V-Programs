
# rv32i

The rv32i compiler is a compiler for 

## Containerized RV32I Compiler (RISC-V)

The following Dockerfile contains the build process for setting up the [RISC-V gnu toolchain](https://github.com/riscv/riscv-gnu-toolchain) for targeting RV32I. This process can take over a hour to build, resulting in an image about 10 GB in size. The compiler base image may be removed after the build leaving just the compiler image in order to save space.

``` bash
sudo ./build_compiler.sh
```

### WORKING HELP FULL COMMANDS

``` bash
riscv32-unknown-elf-gcc -march=rv32i -mabi=ilp32 -nostdlib -Wl,-T,<linker-file>.ld -o <program>.elf <program>.c
riscv32-unknown-elf-gcc -march=rv32i -mabi=ilp32 -nostdlib -Wl,-T,cpu_memory.ld,-Map=out.map -o out.elf test.c
riscv32-unknown-elf-objdump -d out.elf
riscv32-unknown-elf-objcopy -O binary out.elf test.bin
hexdump -e '"%08x\n"' test.bin
hexdump -e '"%08x\n"' test.bin > text.hex
```