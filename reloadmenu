#!/bin/bash

res=$(echo "i3|sxhkd" | rofi -sep "|" -dmenu -i -p 'Reload:' -width 8 -lines 2)

case $res in
	"i3")
		i3-msg restart
		exit
		;;
	"sxhkd")
		pkill -USR1 -x sxhkd
		exit
		;;
	*)
		exit
		;;
esac
