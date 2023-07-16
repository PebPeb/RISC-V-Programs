# Use Ubuntu 22.04.2 as the base image
FROM ubuntu:22.04.2


# Download all the compilers dependencies
RUN apt-get update && apt-get install -y \
    autoconf \
    automake \
    autotools-dev\
    curl \
    python3 \
    python3-pip \
    libmpc-dev \
    libmpfr-dev \
    libgmp-dev \
    gawk \
    build-essential \
    bison \
    flex \
    texinfo \
    gperf \
    libtool \
    patchutils \
    bc \
    zlib1g-dev \
    libexpat-dev \
    ninja-build \
    git \
    cmake \
    libglib2.0-dev 

# Clone the riscv toolchain
RUN git clone https://github.com/riscv/riscv-gnu-toolchain /compiler
WORKDIR /compiler/riscv-gnu-toolchain

# RV32I
RUN ./configure --prefix=/opt/riscv32i --with-arch=rv32i --with-abi=ilp32
RUN make
