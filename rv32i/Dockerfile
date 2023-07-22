# Use Ubuntu 22.04 as the base image
FROM ubuntu:22.04 as base

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
RUN git clone https://github.com/riscv/riscv-gnu-toolchain /compiler/riscv-gnu-toolchain
WORKDIR /compiler/riscv-gnu-toolchain

# RV32I
RUN ./configure --prefix=/opt/riscv32i --with-arch=rv32i --with-abi=ilp32
RUN make
RUN apt-get update && apt-get install -y bsdmainutils

ENV PATH="/opt/riscv32i/bin:${PATH}"


FROM ubuntu:22.04 as compiler

# Copy only what is necessary
COPY --from=base /opt/riscv32i /opt/riscv32i

RUN apt-get update && apt-get install -y \
    libmpc-dev \
    bsdmainutils \
    make

ENV PATH="/opt/riscv32i/bin:${PATH}"
WORKDIR /opt/riscv32i

