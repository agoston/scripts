#!/bin/bash
C_YRES=800
C_BITRATE=2500000

HEIGHT=$(ffprobe -loglevel 16 -show_streams -select_streams v:0 "$1" | gawk -F '[=.]' '/^height=/ {printf("%s\n", $2);}' | sed 's/N\/A//')

if [[ ${HEIGHT:-$C_YRES} -ge $C_YRES ]]; then
	VF_OPT="-vf scale=-1:${C_YRES}"
	HEIGHT=$C_YRES
fi

#BITRATE=$(ffprobe -loglevel 16 -show_format "$1" | gawk -F '[=.]' '/^bit_rate=/ {printf("%s\n", $2);}' | sed 's/N\/A//')
BITRATE=$[C_BITRATE/C_YRES*HEIGHT]
if [[ $BITRATE -gt $C_BITRATE ]]; then
	BITRATE=$C_BITRATE
fi
BR_OPT="-c:v libvpx-vp9 -crf 28 -b:v $BITRATE -quality good -speed 1 -g 96 -tile-columns 2 -threads 4 -frame-parallel 1 -auto-alt-ref 1 -lag-in-frames 25"

set -x
exec ffmpeg -i "$1" -map 0:v -map 0:a $VF_OPT $BR_OPT -ac 1 -c:a libopus -b:a 96k -f webm "${1%.*}.webm"

exit 0

# unpacked DVD (check out '-vf yadif' !!!) (same also works for .iso image, without '-i concat:' then of course)
# (-crf does not seem to work -- like it was ignored or something; use -b:v with libvpx)
for i in Buurman.en.Buurman.DVD2.iso Buurman.en.Buurman.DVD5.iso Buurman.en.Buurman.DVD6.iso; do ffmpeg -i concat:$(ls -1 ${i}/VIDEO_TS/VTS_*_1.VOB | perl -ape 's/\n/|/g' | sed 's/|$//') -vf yadif -c:v libvpx-vp9 -b:v 2560K -g 80 -tile-columns 6 -frame-parallel 1 -auto-alt-ref 1 -lag-in-frames 25 -c:a libopus -b:a 96k -f webm ${i%.*}.webm; done
