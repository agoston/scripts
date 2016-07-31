#!/bin/bash -x
# thread-safe!
# supports hard links!

FAMILY_DIR=/net/seagoat/home/ftp/video/Family

IFS=$'\n'
for i in $(perl -ale 'if (/.* movie-file="([^.].*?)".*/) {print $1}' </net/seagoat/home/ftp/www/webplay/index.html); do
	NEW="${i%.*}.webm"
	if ! [[ -e "$FAMILY_DIR/$NEW" ]]; then
		# check for hard link & continue outer cycle if found
		while read SAMEFILE; do
			SAMENEW="${SAMEFILE%.*}.webm";
			if [[ -e "$SAMENEW" ]]; then
				ln "$SAMENEW" "$NEW"
				continue 2
			fi
		done < <(find $FAMILY_DIR -samefile "$i" -a '!' -name "$i")
		
		# no hard link, go encode
		encode_low_res.sh "$FAMILY_DIR/$i"
	fi
done
