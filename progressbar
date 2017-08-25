#!/bin/bash
[[ $# -le 0 ]] && echo "$(basename $0): No value provided" >&2 && exit 1

blocks=("" "▏" "▎" "▍" "▌" "▋" "▊" "▉" "█")

repeat() {
	[[ $2 -le 0 ]] && exit

	printf "%0.s${1}" $(seq $2)
}
value=$1 # The percentage value to be displayed
length=${2:-40} # Bar length (in characters)

# 1) Calculate how many characters the percentage equals to
chars=$(($value * $length)) # Characters times 100
wholechars=$(( $chars / 100)) # Amount of whole characters
remainder=$(( $chars % 100 )) # Remaining characters in 100ths, $remainder/100 characters

# Calculate how many eights the remainder is
num=$( bc -l <<< "( $remainder / 100 ) * 8" )
num=$( echo "($num + 0.5) / 1" | bc)

# The bar itself
bar=$(repeat ${blocks[8]} $wholechars)
bar+=${blocks[$num]}
bar+=$(repeat " " $(( $length - ${#bar} )) )
echo "$bar"
