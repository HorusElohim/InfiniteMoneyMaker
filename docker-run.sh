#! /bin/bash

echo -e "[IMM] Docker build run"
echo -e "[IMM] Detection architecture..."
architecture=$(dpkg --print-architecture)

if [[ $architecture == "amd64" ]]; then
  echo -e "[IMM](amd64)"
  dockercmd="-it --rm --gpus all --network host imm $@"
fi

if [[ $architecture == "arm64" ]]; then
  echo -e "[IMM](arm64)"
  dockercmd="-it --rm --runtime nvidia --network host imm $@"
fi

echo "[IMM] Running docker with the following cmd: $dockercmd"
docker run $dockercmd
