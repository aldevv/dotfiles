#!/bin/sh
return_value=$(sudo lsof -i:6600)
[[ -z $return_value ]] && mpd
ncmpcpp
