#!/bin/bash

docker tag registry.gitlab.hpi.de/akita/i/python3-base:0.2.5 registry.gitlab.hpi.de/akita/i/python3-torch:0.2.5
pushd ../../data/TimeEval-algorithms/1-intermediate-images/
# docker build -t registry.gitlab.hpi.de/akita/i/pytorch ./python3-torch
cd ..
docker build -t registry.gitlab.hpi.de/akita/i/lstm_ad ./lstm_ad/
popd
