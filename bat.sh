#!/bin/sh

cap="/sys/class/power_supply/BAT0/capacity"
critical=10
interval=120

if [ -e $cap ]; then
	while true; do
		batc=$(sed 's/%//' $cap)
		[[ $batc -le $critical ]] && echo "BAT: $batc%" > $POPUP_FIFO
		
		sleep $interval
	done &
	echo "Daemon started"
else
	echo "No battery detected" >&2
fi
