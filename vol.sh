#!/bin/sh

command=$1
shift

m=Master
i=${1:-1}

while getopts "i:m:" opt
do
	case $opt in
		i) i=$OPTARG;;
		m) m=$OPTARG;;
	esac
done

extract_vol() {
	vol=$(echo $1 | grep -m 1 "%]" | cut -d "[" -f2 | cut -d "%" -f1)
}

case $command in
	"down") extract_vol "$(amixer set $m ${i}%-)";;
	"mute")
		if amixer get $m | grep "\[on\]"; then
			vol=0
			amixer set $m mute
		else
			extract_vol "$(amixer set $m unmute)"
		fi
		;;
	"up") extract_vol "$(amixer set $m ${i}%+)";;
	*) extract_vol "$(amixer get $m)";;
esac

echo "[VL]$vol" > $POPUP_FIFO
