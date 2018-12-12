#!/bin/bash

DEVICE=/dev/serial/by-id/usb-FTDI_FT232R_USB_UART_A50285BI-if00-port0
echo "$(date) $*" &>>$0.log

(
echo -n ';' # flush any buffer from read buffer
echo -n "$*"
echo -n ';' # send command
) | busybox microcom -t 5000 -X -s 9600 $DEVICE &>>$0.log

## no clue why the 2 sec delay is necessary here
#(sleep 2; echo ';'"$*"';') | busybox microcom -d 10 -t 5000 -X -s 57600 $DEVICE &>>$0.log
