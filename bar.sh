#!/usr/bin/bash

Clock() {
	DATE=$(date "+%a %b %d, %T")
	echo -n "$DATE"
}

while true; do
	echo "%{F#c1ec83}%{B#515151}%{c}$(Clock)"
done

