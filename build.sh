#!/usr/bin/env bash

set -u
set -x
set -e

dirname=$1
# aws s3 sync --delete s3://yokai-data/dev/pytorch-build/$dirname/build ./build_/
rm -r build_ || true
mkdir -p build_/s
cp -r ~/Programmes/pytorch-build/$dirname/build/lib build_/lib
docker build . -t test_patch_pytorch:$dirname
