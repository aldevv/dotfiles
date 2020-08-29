This patch allows for rules to be set up in order to have different default settings on a per
monitor basis.

One primary use case may be to use a different layout for the second screen by default. A good
example would be using a layout with a horziontal split for a vertical side monitor.

While the monitor rules patch can be used on its own it is intended to be used in combination with
the [pertag](https://dwm.suckless.org/patches/pertag/) patch, which would allow for specifying
default layouts per tag, per monitor.

## Features
* control mfact, nmaster, layout and bar positioning on a per monitor basis
* optionally control layout, etc., on a per tag basis with the pertag patch

## Rules

Default example rules are as follows:

```c
static const MonitorRule monrules[] = {
	/* monitor  tag  layout  mfact  nmaster  showbar  topbar */
	{  1,       -1,  2,      -1,    -1,      -1,      -1     }, // use a different layout for the second monitor
	{  -1,      -1,  0,      -1,    -1,      -1,      -1     }, // default
};
```

**monitor** (_filter_) - specifies which monitor this rule applies for
    * the value is the monitor index, this typically depends on what is returned by xrandr
    * a monitor value of `-1` means that this rule applies to all monitors (in practice only
      relevant when pertag is used)

NB: If the monitor index feels inconsistent or unintuitive then you may want to have a look at the
[sortscreens](https://www.mail-archive.com/hackers@suckless.org/msg09400.html) patch.

**tag** (_filter_) - specifies which tag this rule applies for
    * the value is the tag index - it is not a binary mask like with the tags value for client rules
    * a tag value of `-1` means that the rule applies to all tags
    * a tag value of `0`, besides specifying settings for the first tag, also means that the rule
      settings act as the default settings for the monitor
    * the tag option is only available with the monitor rules patch on top of pertag

**layout** - specifies the layout that this rule applies for
    * the value is the layout index in the `layouts[]` array
    * if in doubt leave this as `0` to select the default layout
    * setting this to any value outside of the range of tags is likely to cause a fire

**mfact** - sets the factor of master area size compared to stack area
    * this is a float value in the range of 0.05 to 0.95
    * if set to `-1` then the default value as set in config.h is used

**nmaster** - sets the number of clients in the master area
    * if set to `-1` then the default value as set in config.h is used

**showbar** - indicates whether to show the bar or not on startup
    * if set to `0` then no bar is shown
    * if set to `-1` then the default value as set in config.h is used

**topbar** - controls the position of the bar
    * if set to `1` then the bar shows at the top of the screen
    * if set to `0` then the bar shows at the bottom of the screen
    * if set to `-1` then the default value as set in config.h is used

The rules are looped through from top to bottom once for the monitor.
For the pertag variant, the rules are also looped through once for each tag.

In both cases rule matching ends as soon as one match has been found.

A note about the default matching rule at the end:

```
	{  -1,      -1,  0,      -1,    -1,      -1,      -1     }, // default
```

This is merely there as a hint that it is possible to set certain values if no other matching rules
were found. Logically, as values of `-1` default to the corresponding variables in config.h, this
is redundant and can be removed.

## Download
* [dwm-pertag-monitorrules-6.2.diff)](https://github.com/bakkeby/patches/blob/master/dwm/dwm-pertag-monitorrules-6.2.diff)
* [dwm-monitorrules-6.2.diff](https://github.com/bakkeby/patches/blob/master/dwm/dwm-monitorrules-6.2.diff)