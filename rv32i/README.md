

``` bash
riscv32-unknown-elf-gcc -march=rv32i -mabi=ilp32 -nostdlib -Wl,-T,cpu_memory.ld -o out.elf test.c
riscv32-unknown-elf-gcc -march=rv32i -mabi=ilp32 -nostdlib -Wl,-T,cpu_memory.ld,-Map=out.map -o out.elf test.c
riscv32-unknown-elf-objdump -d out.elf
riscv32-unknown-elf-objcopy -O binary out.elf test.bin
hexdump -e '"%08x\n"' test.bin
hexdump -e '"%08x\n"' test.bin > text.hex
```

## Containerized Compiler

The following Dockerfile builds a containerized compiler for rv32i. This process can take over and hour to build resulting 
in a image about 10 GB in size.

``` bash
sudo ./build_compiler.sh
```

### Docker Help

After building, the binaries only take about 1 GB though I have been unable to figure out how 
to reduce a Docker image size. The desired effect would be to build a rv32i-compiler-base and then remove 
the 8.5 GB taken up by the riscv-gnu-toolchain and save the changes as compiler-base that only takes 
up 1.5 GB instead of 10 GB.

