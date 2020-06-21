#!/bin/bash

name=$(xdotool getwindowname $(xdotool search --name "Station"| tail -1))
id=$(xdotool search --name "Station"| tail -1)
#range='^[0-9][0-9]+$'

focus=$(xdotool getwindowfocus getwindowname)

if [[ $name = "Station" ]]  # =~ compares regular expression
then 
	if [[ $focus != "Station" ]] # dont forget the spaces after [[ !!!
	then
		xdotool windowactivate "$id"
	else
		xdotool windowminimize "$id"
	fi
	
fi
	
