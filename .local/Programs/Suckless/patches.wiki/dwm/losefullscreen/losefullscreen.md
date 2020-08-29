
By default in dwm it is possible to make an application fullscreen, then use the focusstack
keybindings to focus on other windows beneath the current window (or open a new terminal behind the
scenes).

This can leave you in a situation where it is not obvious how to get back to the fullscreen window
up front in order to exit fullscreen.

There exists a patch [alwaysfullscreen](https://dwm.suckless.org/patches/alwaysfullscreen/) that
aims to avoid this by disallowing another client to be focused while a fullscreen window exists.

This patch ensures that clients lose fullscreen if they lose focus.

## Download
* [dwm-losefullscreen-6.2.diff](https://github.com/bakkeby/patches/blob/master/dwm/dwm-losefullscreen-6.2.diff)