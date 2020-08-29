There exists a patch called [fakefullscreen](https://dwm.suckless.org/patches/fakefullscreen/) that
only allow clients to go into "fullscreen" into the place that is currently given to them. As an
example this allows for fullscreen videos to be played in the browser while still being able to see
and work with other windows.

This works well, but the rule is applied globally so you won't be able to go full fullscreen should
you need it.

There exists version of the fakefullscreen patch ([selectivefakefullscreen](https://dwm.suckless.org/patches/selectivefakefullscreen/))
where fake fullscreen can be enabled for certain clients depending on client rules.

This version allows you to toggle / enable fake fullscreen on a per-client basis using keyboard
shortcuts.

## Download
* [dwm-fakefullscreenclient-6.2.diff](https://github.com/bakkeby/patches/blob/master/dwm/dwm-fakefullscreenclient-6.2.diff)
