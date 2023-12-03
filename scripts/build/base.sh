#!/bin/bash

pushd ../../data/TimeEval-algorithms/0-base-images/
docker build -t registry.gitlab.hpi.de/akita/i/python3-base:0.2.5 ./python3-base
popd
