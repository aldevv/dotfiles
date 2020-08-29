The [cfacts](https://dwm.suckless.org/patches/cfacts/) patch, provided that the layout supports it,
allow clients to have a different weight (size) compared to other clients in the same area (stack
or master).

The weight of the client is controlled by keyboard shortcuts.

This patch provides functionality that allows the size of the client to be changed by clicking
and dragging with the mouse.

## Features
* the screen updates as you drag the mouse, what you see is what you get
* the functionality is layout agnostic - mouse movement can be vertical or horizontal
* it is intuitive to use
* mouse cursor changes icon when resizing clients
* the patch is implemented as a separate function and should not conflict with other patches

![dragcfact.gif](dwm/dragcfact/dragcfact.gif)

## Download
* [dwm-cfacts-dragcfact-6.2.diff](https://github.com/bakkeby/patches/blob/master/dwm/dwm-cfacts-dragcfact-6.2.diff)