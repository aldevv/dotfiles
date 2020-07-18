#!/bin/bash
#requires xdotool
name=$(xdotool getwindowname $(xdotool search --name "Station"| tail -1))
id=$(xdotool search --name "Station"| tail -1)
#range='^[0-9][0-9]+$'
workplace=$(xdotool get_desktop)
focus=$(xdotool getwindowfocus getwindowname)
isItRunning="$(pgrep 'Station')"

# returns true if is an empty variable
[[ -z "$isItRunning" ]] && $HOME/.local/bin/Station-1.65.0-x86_64.AppImage

if [[ $name = "Station" ]]  # =~ compares regular expression
then 
	if [[ $focus != "Station" ]] # dont forget the spaces after [[ !!!
	then
		xdotool set_desktop_for_window "$id" "$workplace" && xdotool windowactivate "$id"
	else
		xdotool windowminimize "$id"
	fi
	
fi
	
