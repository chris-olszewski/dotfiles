#!/usr/bin/bash

Clock() {
	DATE=$(date "+%a %b %d, %T")
	echo -n "$DATE"
}

Battery() {
	BAT=$(acpi --battery | cut -d, -f2)
	echo -n "$BAT"
}

while xset q &>/dev/null; do
	echo "%{F#c1ec83}%{B#515151}%{c}$(Clock)%{r}$(Battery)"
	sleep 1
done

