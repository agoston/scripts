#!/bin/bash

# kindle fire 5th gen
XRES=1024
YRES=600

IFS=$'='
while read i j; do
	if [[ $i == 'width' ]]; then WIDTH=$j; fi
	if [[ $i == 'height' ]]; then HEIGHT=$j; fi
done < <(mpv_identify.sh "$1")

#if [[ $WIDTH -gt $XRES ]]; then HEIGHT=$XRES; fi
if [[ $HEIGHT -gt $YRES ]]; then HEIGHT=$YRES; fi

set -x
exec ffmpeg -i "$1" -vf scale="-1:${HEIGHT}" -c:v libvpx-vp9 -b:v 1500K -g 80 -tile-columns 6 -frame-parallel 1 -auto-alt-ref 1 -lag-in-frames 25 -c:a libopus -b:a 64k -f webm "${1%.*}.webm"

exit 0

# unpacked DVD (check out '-vf yadif' !!!) (same also works for .iso image, without '-i concat:' then of course)
# (-crf does not seem to work -- like it was ignored or something; use -b:v with libvpx)
for i in Buurman.en.Buurman.DVD2.iso Buurman.en.Buurman.DVD5.iso Buurman.en.Buurman.DVD6.iso; do ffmpeg -i concat:$(ls -1 ${i}/VIDEO_TS/VTS_*_1.VOB | perl -ape 's/\n/|/g' | sed 's/|$//') -vf yadif -c:v libvpx-vp9 -b:v 2560K -g 80 -tile-columns 6 -frame-parallel 1 -auto-alt-ref 1 -lag-in-frames 25 -c:a libopus -b:a 96k -f webm ${i%.*}.webm; done
