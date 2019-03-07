#!/usr/bin/env python3
import serial
import time
import sys

DEVICE = "/dev/serial/by-id/usb-FTDI_FT232R_USB_UART_A50285BI-if00-port0"
ser = serial.Serial(DEVICE, 9600, timeout = 5)
command = " ".join(sys.argv[1:]) + ";"

if len(sys.argv) <= 1:
    sys.exit('command not specified')

def response():
    # first line is atmega echoing back what it received (for spotting transmission errors)
    echo = ser.readline()
    if not echo:
        time.sleep(0.2)
        return False

    try:
        print(">" + echo.decode())
    except:
        pass
    
    # second line is response
    response = ser.readline()
    if not response:
        time.sleep(0.2)
        return False
        
    try:
        print(response.decode())
    except:
        pass
            
    if b"." == response:
        return True

    if b"E T" == response:
        # transmit error
        return False

    # other/misc errors (temperature query didn't respond, etc...)
    return False

# send ; to empty buffer
ser.write(";".encode("ascii", "ignore"))
response()

# retry 5 times
for i in range(5):
    ser.write(command.encode("ascii", "ignore"))
    time.sleep(1)
    if not response():
        continue

    break        
