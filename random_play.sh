#!/bin/bash

PLAYER=echo

LIST=.${0}.list

if ! [[ -s $LIST ]]; then
	find -type f -iregex '.*\.\(mkv\|mp4\|avi\)' | sort -R >$LIST
fi

FILE="$(head -1 $LIST)"
tail -n +2 $LIST >$LIST.tmp
mv $LIST.tmp $LIST
$PLAYER "$FILE"
