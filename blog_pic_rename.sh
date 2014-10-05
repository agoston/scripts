#!/bin/bash

for i in "$@"; do
	if ! [[ "$i" =~ img_[0-9]*_[0-9]*.*\.jpe?g ]]; then
		NEWNAME=$(exiftime "$i" | tr ':' ' ' | gawk '{printf("img_%s%s%s_%s%s%s.jpg", $3, $4, $5, $6, $7, $8); exit}')
		# only rename if exif is right
		if [[ $NEWNAME =~ img_[0-9]{8}_[0-9]{6}.jpg ]]; then
			# find unused filename
			COUNT=2
			while [[ -e $NEWNAME ]]; do
				NEWNAME=${NEWNAME:0:19}_${COUNT}.jpg
				COUNT=$((COUNT+1))
			done
			mv -n -v "$i" $NEWNAME 1>&2
		fi
	fi
done
