#!/bin/sh
name=$1
[[ -z $name ]] || (NAME=${name::-4}.mp4 && ffmpeg -i $name -codec copy $NAME)
