#!/bin/bash

source compiler.properties

docker build --target base --tag $BUILD_NAME-compiler-base .
docker build --target compiler --tag $BUILD_NAME-compiler .
