#!/usr/bin/env bash

set -u
set -e

dirname=$1
mkdir -p ./pytorch-build/
aws s3 sync --delete s3://yokai-data/dev/pytorch-build/$dirname/build ./build/
docker build . -t test_patch_pytorch
