#!/bin/bash
MYSQL="mysql -uUSER -pPASS"

# bail in any errors
set -e

if ! [ $# -eq 2 ]; then
    echo "Usage:"
    echo "$0 <source> <dest>"
    exit 1
fi

FROMDB="$1"
TODB="$2"

# create database if not exists
echo "create database if not exists $TODB" | $MYSQL -NB $FROMDB

# move tables
echo 'show tables' | $MYSQL -NB $FROMDB | while read i; do echo "drop table if exists ${TODB}.${i}; rename table ${FROMDB}.${i} to ${TODB}.${i};"; done | $MYSQL $FROMDB

# drop source DB
echo "drop database $FROMDB" | $MYSQL -NB $FROMDB
