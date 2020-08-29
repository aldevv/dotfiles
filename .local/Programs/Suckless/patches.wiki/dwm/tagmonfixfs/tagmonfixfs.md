dwm comes with a function `tagmon` that allow for a client to be sent from one monitor to another.

By default if a client is in fullscreen then it will remain on the original monitor until it loses
fullscreen, at which point the client will appear on the adjacent monitor.

This patch allow for fullscreen clients to be moved from one monitor to another while remaining
in fullscreen.

It should be noted that _some_ clients, e.g. alacritty, do not handle this well.

## Download
* [dwm-tagmonfixfs-6.2.diff](https://github.com/bakkeby/patches/blob/master/dwm/dwm-tagmonfixfs-6.2.diff)