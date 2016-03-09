#!/bin/bash -x

# kindle fire 5th gen
XRES=1024
YRES=600

exec ffmpeg -i "$1" -vf scale="'if(gt(a,${XRES}/${YRES}),if(gt(ih,${XRES}),${XRES},-1),-1)':'if(gt(a,${XRES}/${YRES}),-1,if(gt(iw,${YRES}),${YRES},-1))'" -c:v libvpx-vp9 -b:v 1500K -g 80 -tile-columns 6 -frame-parallel 1 -auto-alt-ref 1 -lag-in-frames 25 -c:a libopus -b:a 64k -f webm "${1%.*}.webm"

exit 0

# unpacked DVD (check out '-vf yadif' !!!) (same also works for .iso image, without '-i concat:' then of course)
for i in Buurman.en.Buurman.DVD2.iso Buurman.en.Buurman.DVD5.iso Buurman.en.Buurman.DVD6.iso; do ffmpeg -i concat:$(ls -1 ${i}/VIDEO_TS/VTS_*_1.VOB | perl -ape 's/\n/|/g' | sed 's/|$//') -vf yadif -c:v libvpx-vp9 -b:v 2560K -g 80 -tile-columns 6 -frame-parallel 1 -auto-alt-ref 1 -lag-in-frames 25 -c:a libopus -b:a 64k -f webm ${i%.*}.webm; done

# same with crf=23 (for semi-constant quality; not really usable, bitrate floats around 3500K regardless of crf)
ffmpeg -i XXX -vf yadif -c:v libvpx-vp9 -b:v 2560K -g 80 -tile-columns 6 -frame-parallel 1 -auto-alt-ref 1 -lag-in-frames 25 -c:a libopus -b:a 96k -f webm XXX.webm2
