#!/bin/sh
cd "$SCRIPTS"
# name=$(fzf --layout=reverse)

name=$(fd . -t f $SCRIPTS/utilities $SCRIPTS/automation $SCRIPTS/os/solus/Build-Programs/ | fzf --preview='bat --color always {}')
[ -n "$name" ] && nvim "$name"
