

``` bash
riscv32-unknown-elf-gcc -march=rv32i -mabi=ilp32 -nostdlib -Wl,-T,<linker-file>.ld -o <program>.elf <program>.c
riscv32-unknown-elf-gcc -march=rv32i -mabi=ilp32 -nostdlib -Wl,-T,cpu_memory.ld,-Map=out.map -o out.elf test.c
riscv32-unknown-elf-objdump -d out.elf
riscv32-unknown-elf-objcopy -O binary out.elf test.bin
hexdump -e '"%08x\n"' test.bin
hexdump -e '"%08x\n"' test.bin > text.hex
```

## Containerized Compiler

For those not using linux the following Dockerfile builds a containerized compiler for rv32i. This process can take over and hour to build resulting in an image about 10 GB in size.

``` bash
sudo ./build_compiler.sh
```
