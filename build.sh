#!/bin/bash

docker build -f Dockerfile.$1 -t ljocha/sitsem21:$1 .
