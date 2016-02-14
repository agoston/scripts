#!/bin/bash -x
exec ffmpeg -i $1 -vf scale="-1:'if(gt(ih,600),600,ih)'" -c:v libvpx-vp9 -b:v 1280K -tile-columns 6 -frame-parallel 1 -auto-alt-ref 1 -lag-in-frames 25 -c:a libopus -b:a 64k -f webm -threads 4 ${1%.*}.webm
