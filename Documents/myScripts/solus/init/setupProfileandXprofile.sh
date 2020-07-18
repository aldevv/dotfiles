#!/bin/sh
echo \
'#!/bin/bash

source /usr/share/defaults/etc/profile
source $HOME/.profile
source $HOME/.xprofile

exec $*' > /usr/bin/lightdm-wrapper
