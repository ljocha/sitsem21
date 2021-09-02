#!/bin/bash

docker build -f Dockerfiles/Dockerfile.$1 -t ljocha/sitsem21:${1:-std} .
