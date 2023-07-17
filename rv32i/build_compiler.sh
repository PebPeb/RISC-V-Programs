#!/bin/bash

docker build --target base --tag rv32i-compiler-base .
docker build --target compiler --tag rv32i-compiler .
