#!/bin/bash

DEVICE=/dev/serial/by-id/usb-FTDI_FT232R_USB_UART_A50285BI-if00-port0

# no clue why the 2 sec delay is necessary here
(sleep 2; echo ';'"$*"';') | busybox microcom -d 10 -t 5000 -X -s 57600 $DEVICE
