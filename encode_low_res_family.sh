#!/bin/bash

FAMILY_DIR=/net/seagoat/home/ftp/video/Family

IFS=$'\n'
for i in $(perl -ale 'if (/.* movie-file="([^.].*?)".*/) {print $1}' </net/seagoat/home/ftp/www/webplay/index.html); do
	OLD="$FAMILY_DIR/$i"
	NEW="${OLD%%.*}.webm"
	if ! [[ -e "$NEW" ]]; then
		encode_low_res.sh "$OLD"
	fi
done
