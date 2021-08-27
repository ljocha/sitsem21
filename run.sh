#!/bin/bash

docker run -ti -e OMP_NUM_THREADS=1 -e HOME=/work -u $(id -u) -p 8888:8888 -v $PWD:/work ljocha/sitsem21:$1

