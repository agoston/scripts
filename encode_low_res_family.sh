#!/bin/bash -x
# thread-safe!
# supports hard links!

function movie_duration() {
	ffprobe -loglevel 16 -show_format "$1" | gawk -F '[=.]' '/^duration=/ {printf("%s\n", $2);}' | sed 's/N\/A/0/'
}

FAMILY_DIR=/net/seagoat/home/ftp/video
WEBPLAY=/net/seagoat/home/ftp/www/webplay/index.html

cd $FAMILY_DIR

IFS=$'\n'
for i in $(perl -ale 'if (/.* movie-file="([^.].*?)".*/) {print $1}' <$WEBPLAY); do
	NEW="${i%.*}.webm"
	
	# check if mtime between 1-14 days and shorter duration
	if [ $(find . -type f -path "*/$NEW" -mmin +5 -mtime -14) ]; then
		ORIG_DURATION=$(movie_duration "$i")
		NEW_DURATION=$(movie_duration "$NEW")
		
		if [[ ${ORIG_DURATION:-0} -gt 0 ]] && [[ $((ORIG_DURATION-NEW_DURATION)) -gt 30 ]]; then
			rm "$NEW"
		fi
	fi
	
	if ! [[ -e "$NEW" ]]; then
		# check for hard link & continue outer cycle if found
		# FIXME: didn't check if other file's duration is OK -- this would happily hardlink a half-baked file
		while read SAMEFILE; do
			SAMENEW="${SAMEFILE%.*}.webm";
			if [[ -e "$SAMENEW" ]]; then
				ln "$SAMENEW" "$NEW"
				continue 2
			fi
		done < <(find -samefile "$i" -a '!' -wholename "$i")
		
		# no hard link, go encode
		encode_low_res.sh "$i"
	fi
done
