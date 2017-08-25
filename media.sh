#!/bin/bash

icon=

while test $# -gt 0; do
	case "$1" in
		--play)
			icon="\uE037"
			break
			;;
		--pause)
			icon="\uE034"
			break
			;;
		--play-pause)
			if [ $(playerctl status) = "Paused" ]; then
				icon="\uE034"
			else
				icon="\uE037"
			fi
			break
			;;
		-n|--next)
			icon="\uE044"
			break
			;;
		-p|--prev)
			icon="\uE045"
			break
			;;
		-s|--stop)
			icon="\uE047"
			break
			;;
		*)
			echo "Invalid flag"
			exit
			;;
	esac
done

artist=$(playerctl metadata artist)
title=$(playerctl metadata title)

[ -n $icon ] && echo -e "$icon $artist - $title" > $POPUP_FIFO
