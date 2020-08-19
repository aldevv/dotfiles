#!/bin/bash
pydoc modules | sed '/^$/d' | head -n -2 | awk '{print $1}{print $2}{print $3}{print $4}' | dmenu -l 30
