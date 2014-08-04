#!/bin/bash

ID=$(mysql -uroot -NBr -e "select ID from wp_posts where post_status = 'pending' LIMIT 1" WORDPRESS | head -1)

if ! [[ $ID ]]; then
	exit 0
fi

set -e

TMPDIR=$(mktemp -d)
POSTFILE=$(mktemp)

mysql -uroot -NBr -e "select post_content from wp_posts where ID = $ID" WORDPRESS | while read i; do
	if [[ $i =~ /wp-content/uploads/ ]]; then
		A=${i#*=\"}
		URL=${A%%\"*}
		FILE=${URL##*.nl/}
		cp /home/ftp/www/$FILE $TMPDIR
		pushd $TMPDIR &>/dev/null
		blog_pictures
		rm *
		popd &>/dev/null
	else
		echo "$i"
	fi
done | perl -0 -pe 's|</a>\n*<a |</a><a |g' >$POSTFILE

mysql -uroot -NBr -e "update wp_posts set post_content=0x$(xxd -p $POSTFILE | tr -d '\n'), post_status='publish' where ID = $ID" WORDPRESS

rm -f $POSTFILE
rm -rf $TMPDIR
