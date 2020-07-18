#!/bin/sh
echo \
'# Written by systemd-localed(8), read by systemd-localed and Xorg. It"s
# probably wise not to edit this file manually. Use localectl(1) to
# instruct systemd-localed to update it.
Section "InputClass"
        Identifier "system-keyboard"
        MatchIsKeyboard "on"
        Option "XkbLayout" "latam"
        Option "XkbModel" "pc104"
        Option "XkbVariant" "colemak"
        Option "XkbOptions" "caps:escape"
EndSection' > /etc/X11/xorg.conf.d/00-keyboard.conf
