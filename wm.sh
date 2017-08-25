#!/bin/bash
focused=■
empty=□
visible=▣

wms=(
	"$empty"
	"$empty"
	"$empty"
	"$empty"
	"$empty"
	"$empty"
	"$empty"
	"$empty"
	"$empty"
	"$empty"
)

while read -r line
do
	num=$(( ${line:0:1} - 1 ))
	[[ $num -lt 0 ]] && num=9 # If the number goes below zero, make it 9
	case $line in
		*\*) wms[$num]="■";;
		*\-) wms[$num]="▣";;
	esac
done <<< "$(wmctrl -d | awk '{print $9 $2}')"
echo "[WM]${wms[@]}" > $POPUP_FIFO
