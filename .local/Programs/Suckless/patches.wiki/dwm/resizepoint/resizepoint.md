By default resizing a floating client window using the mouse in dwm result in:
* the cursor moving to the bottom right corner and
* the size of the client is determined by the top left corner and the mouse position

There exists a neat patch called [resizecorners](https://dwm.suckless.org/patches/resizecorners/)
that allow the cursor to be moved to the nearest corner and the client is then resized from there.

This patch works similarly to the resizecorners patch, except that the mouse cursor does not move
to any of the corners.

## Features
* resize the client window from the point where you clicked
* mouse cursor changes icon when resizing clients depending on the nearest corner
* it is intuitive to use
* it ignores application resize hints while resizing for smooth operation *

(* both the built-in functionality and the resizecorners patch respect resize hints, which can
   cause a jagged feel when resizing terminals)

![resizepoint.gif](dwm/resizepoint/resizepoint.gif)

## Download
* [dwm-resizepoint-6.2.diff](https://github.com/bakkeby/patches/blob/master/dwm/dwm-resizepoint-6.2.diff)