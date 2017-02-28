#!/bin/bash -x
# thread-safe!
# supports hard links!

FAMILY_DIR=/net/seagoat/home/ftp/video/Family
WEBPLAY=/net/seagoat/home/ftp/www/webplay/index.html

cd $FAMILY_DIR

IFS=$'\n'
for i in $(perl -ale 'if (/.* movie-file="([^.].*?)".*/) {print $1}' <$WEBPLAY); do
	NEW="${i%.*}.webm"
	
	# check if mtime between 1-14 days and no duration
	if [ $(find . -maxdepth 1 -type f -name "$NEW" -mmin +120 -mtime -14) ]; then
		if ffprobe -show_format "$NEW" 2>/dev/null | grep -q 'duration=N/A'; then
			rm "$NEW"
		fi
	fi
	
	if ! [[ -e "$NEW" ]]; then
		# check for hard link & continue outer cycle if found
		while read SAMEFILE; do
			SAMENEW="${SAMEFILE%.*}.webm";
			if [[ -e "$SAMENEW" ]]; then
				ln "$SAMENEW" "$NEW"
				continue 2
			fi
		done < <(find -samefile "$i" -a '!' -name "$i")
		
		# no hard link, go encode
		encode_low_res.sh "$i"
	fi
done
