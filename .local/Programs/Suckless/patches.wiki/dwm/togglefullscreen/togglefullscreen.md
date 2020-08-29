By default in dwm fullscreen is something that is triggered by client windows, e.g. pressing `F11`
in a browser, `ctrl+f` in some programs and `shift+enter` in others.

There exists a [fullscreen](https://dwm.suckless.org/patches/fullscreen/) patch which simulates
fullscreen by forcing `monocle` layout and toggling the display of the bar.

There also exists an [actualfullscreen](https://dwm.suckless.org/patches/actualfullscreen/) patch
that explicitly toggles fullscreen for the client window.

Technically this patch is identical to the actualfullscreen one.

The main benefit of a patch like this is that you can make any window fullscreen using the same
keybinding.

One thing to note is that some applications have special fullscreen modes that can only be
activated through the client window, e.g. browser fullscreen which removes toolbars and decorations
or distraction free modes in various editors.

## Download
* [togglefullscreen](https://github.com/bakkeby/patches/blob/master/dwm/dwm-togglefullscreen-6.2.diff)