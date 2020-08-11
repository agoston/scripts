#!/bin/bash
ffmpeg -f concat -safe 0 -i <(for i in "$@" ; do echo "file '$PWD/$i'"; done) -c copy ~/output.mp4
