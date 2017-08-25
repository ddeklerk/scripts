#!/bin/bash

res=$(echo "logout|reboot|shutdown" | rofi -sep "|" -dmenu -i -p '' -width 8 -lines 3)

case $res in
	"logout")
		i3-msg exit
		exit
		;;
	"reboot")
		systemctl reboot
		exit
		;;
	"shutdown")
		systemctl poweroff
		exit
		;;
	*)
		exit
		;;
esac
