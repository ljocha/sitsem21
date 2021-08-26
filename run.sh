#!/bin/bash

cnt=$(ls -t .local/share/jupyter/runtime/nbserver-*-open.html | wc -l)
export cnt

(
cnt2=$cnt
while [ $cnt = $cnt2 ]; do
	sleep .2
	cnt2=$cnt
	cnt=$(ls -t .local/share/jupyter/runtime/nbserver-*-open.html | wc -l)
done

f=$(ls -t .local/share/jupyter/runtime/nbserver-*-open.html | head -1)
open file://$PWD/$f
) &

docker run -ti -e HOME=/work -u $(id -u) -p 127.0.0.1:8888:8888 -v $PWD:/work ljocha/sitsem21

wait
