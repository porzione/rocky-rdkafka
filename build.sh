#!/bin/bash

set -e

docker build \
       $@ \
       -t rlkafka .

docker tag rlkafka porzione/rlkafka
