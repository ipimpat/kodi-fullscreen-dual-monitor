#!/bin/bash

NAME='Kodi'
SCREEN_LEFT_POSITION="0,0"
SCREEN_RIGHT_POSITION="1920,0"

# Position XBMC Window function
position_xbmc_window() 
{

	# Wait for XBMC Window
	while [ -z "`wmctrl -l | grep \"$NAME\"`" ]
	do
		sleep 1
	done

	# Make sure XBMC is a free floating window
	wmctrl -r "$NAME" -b remove,fullscreen
	sleep 0.5
	wmctrl -r "$NAME" -b remove,maximized_vert,maximized_horz
        sleep 0.5

	# Position XBMC window on correct screen
	if [ "$1" = "left" ]
	then		
		wmctrl -r "$NAME" -e '0,'"$SCREEN_LEFT_POSITION"',-1,-1'
	elif [ "$1" = "right" ]
	then
		wmctrl -r "$NAME" -e '0,'"$SCREEN_RIGHT_POSITION"',-1,-1'
	fi
        sleep 0.5

	# Make it fullscreen
        wmctrl -r "$NAME" -b add,maximized_vert,maximized_horz
        sleep 0.5
	wmctrl -r "$NAME" -b add,fullscreen

}

start_xbmc()
{

	ps cax | grep 'xbmc.bin' > /dev/null

	if [ $? -ne 0 ]; then
		SDL_VIDEO_ALLOW_SCREENSAVER=0 exec xbmc
	fi

}

# Main
case "$1" in

	# Left screen
	left)
		SCREEN="left"
	;;
	# Right screen
	right)
		SCREEN="right"
	;;

	*)
		echo ""
		echo "Usage: $0 {left|right}"
		exit 1
esac

position_xbmc_window "$SCREEN" & start_xbmc

