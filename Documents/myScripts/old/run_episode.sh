#!/bin/bash
mpv "$EPISODES/$(ls ~/Downloads/*mkv| sed 's/^.*\///g' | dmenu -l 30)"
