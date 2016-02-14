#!/bin/bash -x

# kindle fire 5th gen
XRES=1024
YRES=600


exec ffmpeg -i $1 -vf scale="'if(gt(a,${XRES}/${YRES}),if(gt(ih,${XRES}),${XRES},-1),-1)':'if(gt(a,${XRES}/${YRES}),-1,if(gt(iw,${YRES}),${YRES},-1))'" -c:v libvpx-vp9 -b:v 1280K -tile-columns 6 -frame-parallel 1 -auto-alt-ref 1 -lag-in-frames 25 -c:a libopus -b:a 64k -f webm -threads 4 ${1%.*}.webm
