#!/bin/bash
mpv "$HOME/Downloads/$(ls $HOME/Downloads/*mkv  | sed 's/^.*\///g' | dmenu -l 30)" 2>some.log

