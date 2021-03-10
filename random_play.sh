#!/bin/bash -x

LIST=.$(basename $0).list

if ! [[ -s $LIST ]]; then
	find . -type f -name '*.mkv' | sort -R >$LIST
fi

FILE="$(head -1 $LIST)"
tail -n +2 $LIST >$LIST.tmp
mv $LIST.tmp $LIST
mpv "$FILE"
