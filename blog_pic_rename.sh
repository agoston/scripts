#!/bin/bash

for i in "$@"; do
	NEWNAME=$(exiftime "$i" | tr ':' ' ' | gawk '{printf("img_%s%s%s_%s%s%s.jpg", $3, $4, $5, $6, $7, $8); exit}')
	# only rename if exif is right
	if [[ $NEWNAME =~ img_[0-9]{8}_[0-9]{6}.jpg ]]; then
		# self?
		if [[ "$NEWNAME" == "$i" ]]; then continue; fi

		# find unused filename
		COUNT=2
		while [[ -e $NEWNAME ]]; do
			NEWNAME=${NEWNAME:0:19}_${COUNT}.jpg
			COUNT=$((COUNT+1))
		done
		mv -n -v "$i" $NEWNAME 1>&2
	fi
done
