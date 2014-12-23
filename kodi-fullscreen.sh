#!/bin/bash

WINDOW='Kodi'
SCREEN_LEFT_POSITION="0,0"
SCREEN_RIGHT_POSITION="1920,0"

# Position Kodi Window function
position_kodi_window() 
{

	# Wait for Kodi Window
	while [ -z "`wmctrl -l | grep \"$WINDOW\"`" ]
	do
		sleep 1
	done

	# Make sure Kodi is a free floating window
	wmctrl -r "$WINDOW" -b remove,fullscreen

	# Relax a little before next action
	sleep 0.5

	wmctrl -r "$WINDOW" -b remove,maximized_vert,maximized_horz

	# Relax a little before next action
        sleep 0.5

	# Position Kodi window on correct screen
	if [ "$1" = "left" ]
	then		
		wmctrl -r "$WINDOW" -e '0,'"$SCREEN_LEFT_POSITION"',-1,-1'
	elif [ "$1" = "right" ]
	then
		wmctrl -r "$WINDOW" -e '0,'"$SCREEN_RIGHT_POSITION"',-1,-1'
	fi

	# Relax a little before next action
        sleep 0.5

	# Make it fullscreen
        wmctrl -r "$WINDOW" -b add,maximized_vert,maximized_horz

	# Relax a little before next action
        sleep 0.5

	wmctrl -r "$WINDOW" -b add,fullscreen

}

start_kodi()
{

	ps cax | grep 'kodi.bin' > /dev/null

	if [ $? -ne 0 ]; then
		SDL_VIDEO_ALLOW_SCREENSAVER=0 exec kodi
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

position_kodi_window "$SCREEN" & start_kodi

