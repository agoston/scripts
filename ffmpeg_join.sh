#!/bin/bash
if [[ $# -lt 1 ]]; then
	echo "usage: $0 file.mp4 file.mp4 file.mp4"
	echo "output is written to 'output.mp4'"
	exit 1
fi

ffmpeg -f concat -safe 0 -i <(for i in "$@" ; do echo "file '$PWD/$i'"; done) -c copy ~/output.mp4
