#!/bin/sh

TOUCHPAD_ID=`xinput | grep TouchPad | egrep -o id=[0-9]* | cut -d '=' -f2`

if [ "x$1" = "x" ]
then
    echo "Usage: $0 enable|disable"
elif [ "$1" = "enable" ]
then
    xinput set-prop $TOUCHPAD_ID "Device Enabled" 1
elif [ "$1" = "disable" ]
then
    xinput set-prop $TOUCHPAD_ID "Device Enabled" 0
else
    echo "Usage: $0 enable|disable"
fi
