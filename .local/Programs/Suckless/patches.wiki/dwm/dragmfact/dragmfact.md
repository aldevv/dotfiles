The size of the master area vs the stack area in dwm is something that is intended to be
controlled via keyboard shortcuts (`MOD+h`/`MOD+l`).

There exists a patch [dragmfact](https://dwm.suckless.org/patches/dragmfact/) that allow users to
change this size using the mouse.

This patch works as-is, but it has a few shortfalls:

* the screen is only redrawn when you release the mouse button - this gives a sort of clunky feel
  to it
* the mechanism is specifically coded for the `tile` layout alone, which makes it both clunky and
  unintuitive to use for other layouts such as [bottomstack](https://dwm.suckless.org/patches/bottomstack/)
* the code also hooks into the `resizemouse` function, which can cause conflicts with other patches

This version of the dragmfact patch improves on all of the above.

## Features
* the screen updates as you drag the mouse, what you see is what you get
* the functionality is layout aware - changing between vertical or horizontal adjustment as needed
* it is intuitive to use, even with layouts such as centered master
* does not allow mfact to be changed for layouts where mfact does not apply, e.g. monocle or
  floating layout
* mouse cursor changes icon depending on whether it is a vertical or horizontal split
* it is a separate function, so should not conflict with other patches

![dragmfact.gif](dwm/dragmfact/dragmfact.gif)

## Download
* [dwm-dragmfact-6.2.diff](https://github.com/bakkeby/patches/blob/master/dwm/dwm-dragmfact-6.2.diff)