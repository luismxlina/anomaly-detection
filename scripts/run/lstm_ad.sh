#!/bin/bash
#
dataset=$1;
pushd ../../data/TimeEval-algorithms/;

docker run --rm \
    -v $(pwd)/data:/data:ro \
    -v $(pwd)/results:/results:rw \
    registry.gitlab.hpi.de/akita/i/lstm_ad:latest execute-algorithm "{
    \"executionType\": \"execute\",
    \"dataInput\": \"/data/${dataset}\",
    \"dataOutput\": \"/results/anomaly_scores_lstm_ad.ts\",
    \"modelInput\": \"/results/model_lstm_ad.pkl\",
    \"modelOutput\": \"/results/model_lstm_ad.pkl\",
    \"customParameters\": {}
}";

popd;
