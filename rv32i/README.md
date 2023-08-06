
# rv32i

The rv32i compiler is a compiler for 



## Containerized Compiler

For those not using linux or are interested in the following Dockerfile builds a containerized compiler for rv32i. This process can take over and hour to build resulting in an image about 10 GB in size. The compiler base image may be removed after the build leaving just the compiler image in order to save space.

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