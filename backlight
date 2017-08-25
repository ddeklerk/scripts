#!/bin/sh

command=$1
shift

i=${1:-5}

while getopts "i:" opt
do
	case $opt in
		i) i=$OPTARG;;
	esac
done

case $command in
	"down") light -U $i && extract_bl;;
	"up") light -A $i && extract_bl;;
esac

br=$(light -G | awk '{print int(($1 + 2.5) / 5) * 5}')

echo "[BL]$br" > $POPUP_FIFO
