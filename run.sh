#!/bin/bash

flavor=${1:-std}
port=${2:-8888}

docker run -ti -e OMP_NUM_THREADS=1 -e HOME=/work -u $(id -u) -p $port:$port -v $PWD:/work ljocha/sitsem21:$flavor

