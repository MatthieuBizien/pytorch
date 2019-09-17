#!/usr/bin/env bash

set -e
set -u

CTIME=$(date --iso=s | cut -d + -f 1 | sed s/:/-/g)
IMAGE="979731122486.dkr.ecr.us-east-1.amazonaws.com/pytorch:$CTIME"

# Check installed package
which ts  > /dev/null || sudo apt-get install moreutils

# Build
echo "Building, logs go to ~/build-pytorch.log.${CTIME}"
export DOCKER_BUILDKIT=1
docker build docker/pytorch -t "${IMAGE}" | ts > "$HOME/build-pytorch.log.${CTIME}"

# Test the build
docker run --entrypoint python "${IMAGE}" python <<END
import torch
x = torch.zeros((1, 8, 32, 32)).cuda()
torch.nn.Conv2d(8, 8, 3).to(x.device)(x)
print("Test of the new install successful")
END

# Extract the site-package of Pytorch
docker run --entrypoint bash "${IMAGE}" \
   -c "cd /opt/conda/lib/python3.6/site-packages/torch; tar -zcf - ." > "torch.tgz.${CTIME}"

# Push it to S3
aws s3 cp "torch.tgz.${CTIME}" "s3://yokai-data/dev/python3.6/site-packages/torch/torch.tgz.${CTIME}"

# Push the Docker image to ECR, because why not
$(aws ecr get-login --no-include-email)
docker push "${IMAGE}"
