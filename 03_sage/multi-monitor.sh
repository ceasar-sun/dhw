#!/bin/sh

export LC_ALL=C

chech_display="$(xrandr | grep -E '(^DP-2|^DVI-I-1|^DP-2|^DVI-D-1) connected' )"

if [ -n "$chech_displa" ] ; then 
	xrandr --output DP-2 --output DVI-I-1  --right-of DP-2 --output DVI-D-1 --right-of DVI-I-1 --output DP-1 --right-of DVI-D-1
fi
exit 0 ;
