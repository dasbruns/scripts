#!/bin/bash

#echo $1
#echo "$1"="-f"

if [ "$1" = "-f" ]
	then upower -i  /org/freedesktop/UPower/devices/battery_BAT0
	exit 0
fi

if [ "$1" = "-p" ]
	then upower -i  /org/freedesktop/UPower/devices/battery_BAT0|grep 'percentage'|awk -F' ' '{print $2}'
	exit 0
fi

upower -i  /org/freedesktop/UPower/devices/battery_BAT0|grep 'time to'|awk -F' ' '{print $4,$5}'
