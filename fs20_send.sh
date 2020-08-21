#!/bin/bash
echo "$(date) $1 $2" &>>$0.log

(
echo "set FS20_cf4b0$1 $2"
sleep 2
echo "set FS20_cf4b0$1 $2"
sleep 2
echo "set FS20_cf4b0$1 $2"
sleep 2
echo "set FS20_cf4b0$1 $2"
sleep 2
echo "set FS20_cf4b0$1 $2"
sleep 2
echo "set FS20_cf4b0$1 $2"

) | socat - tcp:localhost:7072 &>>$0.log
