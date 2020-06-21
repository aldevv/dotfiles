#!/bin/bash
mpv "/home/solus/Downloads/$(ls ~/Downloads/*mkv| sed 's/^.*\///g' | dmenu -l 30)"
