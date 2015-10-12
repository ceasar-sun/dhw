#!/bin/bash

##########
# usage : start-sage-client-browser.sh 0 1 2 3
# To create 0,1,2,3  (for node-3)
##########

DISPLAY_ID=""
MONITOR_WIDTH=1920
DISPLAY_URL="https://master:9090/display.html\?clientID="
BROWSER_PARAM="--use-gl --allow-file-access-from-files --kiosk --no-default-browser-check  --disable-session-crashed-bubble  --disable-popup-blocking --no-first-run --allow-running-insecure-content"

hostname="$(hostname)"

# Main

while [ $# -gt 0 ]; do
	case "$1" in
		*)	DISPLAY_ID="$DISPLAY_ID $1" ;shift ;;
	esac
done

if [ -z "$DISPLAY_ID"  -a "$hostname" == 'node-1'  ] ; then
	DISPLAY_ID="8 9 10 11"
elif [ -z "$DISPLAY_ID"  -a "$hostname"  ==  'node-2' ] ; then 
	DISPLAY_ID="4 5 6 7"
elif [ -z "$DISPLAY_ID"  -a "$hostname"  ==  'node-3' ] ; then 
	DISPLAY_ID="0 1 2 3"
elif [ -z "$DISPLAY_ID"  -a "$hostname"  ==  'Ceasar-PC' ] ; then 
	DISPLAY_ID="7 8 9 0"
else
	echo "no match config for '$hostname' .  Exit !!"
fi

for i in $DISPLAY_ID ; do
	_session_dir="$HOME/.config/sage-chrome.cache/pid-${i}"
	_win_x_pos=$(expr $i % 4 \* $MONITOR_WIDTH )
	[ -d "$_session_dir" ] || mkdir -p  $_session_dir
	sub_param="--window-position=$_win_x_pos,0 --user-data-dir=$_session_dir --app=${DISPLAY_URL}$i  "
	full_comm="google-chrome $BROWSER_PARAM $sub_param "
	echo "$full_comm"
	$full_comm &
done

exit 0;
