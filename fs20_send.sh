#!/bin/bash
echo "set FS20_cf4b0$1 $2" | socat - tcp:localhost:7072 &>>$0.log