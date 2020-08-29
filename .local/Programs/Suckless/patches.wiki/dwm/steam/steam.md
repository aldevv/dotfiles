Steam, and steam windows (games), trigger a ConfigureNotify request every time the window
gets focus. More so, the configure event passed along from Steam tends to have the wrong
x and y co-ordinates which can make the window, if floating, jump around the screen.

This patch works around this age-old issue by ignoring the x and y co-ordinates for
ConfigureNotify requests relating to Steam windows.

## Download
* [dwm-steam-6.2.diff](https://github.com/bakkeby/patches/blob/master/dwm/dwm-steam-6.2.diff)
