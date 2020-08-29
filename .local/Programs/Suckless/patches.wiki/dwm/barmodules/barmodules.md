The barmodules patch replaces the bar in dwm with an alternate solution that allows for positioning of the individual features of the bar.

## Features
* simpler integration for the more complicated dwm bar patches
* control the position of features on the bar, re-arrange as you please
* optionally have more than one bar per monitor
* have different bar features on a secondary monitor
* avoids the need for patches such as [leftlayout](https://dwm.suckless.org/patches/leftlayout/), [statusallmons](https://dwm.suckless.org/patches/statusallmons/) and [staticstatus](https://dwm.suckless.org/patches/staticstatus/)

## How does the bar in dwm work?

In dwm the code for the bar is lean, simple and straightforward. In one function it prints the status, the tags, the layout symbol and the remaining space is used to show the title of the currently focused window.

When it comes to mouse clicks this is handled in a similar manner. In one function it works out the width of each tag, the width of the layout symbol, the width of the status and whether the mouse click event was within any of these.

The bar as-is provides a lot of functionality for less than 90 lines of code.

## Why the need for a change?

Most users of dwm should be able to get by just fine with the bar mechanism as-is.

The problem is that there are 30+ patches out there that all manipulate the bar in one way or another. Applying more than one of these patches often result in conflicts that are not always obvious to solve due to the delicate relationship between the `drawbar` and the `buttonpress` functions which need to be perfectly aligned in order for button clicks to work properly.

Due to the way the bar works the content of the bar is also static, which gives rise to patches such as the [leftlayout](https://dwm.suckless.org/patches/leftlayout/) patch just to move the layout symbol to the left of the tags.

## How does the bar modules work then?

The patch introduces a set of bar rules which controls the position of each module.

Each module have separate functions to provide the width of the module, a functions that draws the content on the bar at a given position and a function that handles button clicks.


```
static const BarRule barrules[] = {
    /* monitor  bar    alignment         widthfunc              drawfunc              clickfunc           name */
    { -1,       0,     BAR_ALIGN_LEFT,   width_tags,            draw_tags,            click_tags,         "tags" },
    { -1,       0,     BAR_ALIGN_LEFT,   width_ltsymbol,        draw_ltsymbol,        click_ltsymbol,     "layout" },
    { 'A',      0,     BAR_ALIGN_RIGHT,  width_status,          draw_status,          click_status,       "status" },
    { -1,       0,     BAR_ALIGN_NONE,   width_wintitle,        draw_wintitle,        click_wintitle,     "wintitle" },
};
```

When the bar is drawn these rules are followed in order. This means that it would work out that the tags module should be printed on the left hand side of the bar. It would call the `width_tags` function to know how many pixels wide that module is in order to know where the next module, the layout symbol in this case, would start. The `draw_tags` function is called to actually draw the tags on the bar and the start position and width of the module is saved for later retrieval.

The bar is then drawn up like this according to the above rules.

```
+---------------------------------------------------------------------------------------------------------+
| 1 2 3 4 5 6 7 8 9 []= | st                                                                        | dwm |
+---------------------------------------------------------------------------------------------------------+
```

When the user clicks on the bar the position and width of each module is already known, and the click position _relative_ to the module start position is forwarded to the click function of the respective module.

In effect this means that each module is isolated and only needs to be concerned about it's own functionality - they do not need to worry about what was drawn prior in the bar.

## The bar rules

**monitor** (_filter_) - specifies on which monitor the module is to be displayed

* `-1` - show on all monitors
* `'A'` - show on _active_ monitor, e.g. like how the status follows the mouse cursor in stock dwm
* `0` - show on monitor with index 0

Note that by only using specific monitor indexes one can control whether or not a bar exists for a given monitor. For example only having rules that specify monitor `0` would result in no bar existing for a second monitor.

**bar** (_filter_) - specifies the bar index on which the bar module is to be displayed

Multiple bars are supported, but is limited to two bars for the time being. In practice this is a replacement for the [extrabar](https://dwm.suckless.org/patches/extrabar/) and [dualstatus](https://dwm.suckless.org/patches/dualstatus/) except for the splitting of the status.

Specifying modules for both bar index 0 and 1 will result in two bars being shown on the monitor (top bar + bottom bar).

**alignment** - specifies the position of the module

This adds control over where on the bar a module is placed.

* `BAR_ALIGN_LEFT` - positions the module on the left side of the bar
* `BAR_ALIGN_RIGHT` - positions the module on the right side of the bar
* `BAR_ALIGN_CENTER` - centers the module in the _remaining_ space
    * this means that if the module is to be placed in the dead center of the bar then it needs to be the first rule in the list
    * a centered module also breaks the available space into the left and right hand side of the bar
* `BAR_ALIGN_LEFT_LEFT` - following a center split, place the module on the left hand side on the left of the center module
* `BAR_ALIGN_LEFT_RIGHT` - following a center split, place the module on the right hand side on the left of the center module
* `BAR_ALIGN_LEFT_CENTER` - following a center split, place the module in the middle of the remaining space on the left of the center module
* `BAR_ALIGN_RIGHT_LEFT` - following a center split, place the module on the left hand side on the right of the center module
* `BAR_ALIGN_RIGHT_RIGHT` - following a center split, place the module on the right hand side on the right of the center module
* `BAR_ALIGN_RIGHT_CENTER` - following a center split, place the module in the middle of the remaining space on the right of the center module
* `BAR_ALIGN_NONE` - no particular alignment
    * this is typically used for modules that take up the remaining space, e.g. wintitle, fancybar and awesomebar
    * the NONE alignment is merely there as a visual clue to the reader
    * in practice this aligns the module on the left (default)

**widthfunc** - the function that reports on the width this module requires on the bar

**drawfunc** - the function that actually draws stuff on the bar

**clickfunc** - the function that handles the button clicks

While you may not normally want to mess with these it may be interesting to swap out the click function if you happen to use the [statuscmd](https://dwm.suckless.org/patches/statuscmd/) patch for example.

**name** - this is merely a visual clue for the reader and has no effect

## Download
* [dwm-barmodules-6.2.diff](https://github.com/bakkeby/patches/blob/master/dwm/dwm-barmodules-6.2.diff)
* [dwm-barmodules-awesomebar-6.2.diff](https://github.com/bakkeby/patches/blob/master/dwm/dwm-barmodules-awesomebar-6.2.diff)
* [dwm-barmodules-fancybar-6.2.diff](https://github.com/bakkeby/patches/blob/master/dwm/dwm-barmodules-fancybar-6.2.diff)
* [dwm-barmodules-powerline-6.2.diff](https://github.com/bakkeby/patches/blob/master/dwm/dwm-barmodules-powerline-6.2.diff)
* [dwm-barmodules-status2d-6.2.diff](https://github.com/bakkeby/patches/blob/master/dwm/dwm-barmodules-status2d-6.2.diff)
* [dwm-barmodules-status2d-statuscmd-dwmblocks-extrastatus-6.2.diff](https://github.com/bakkeby/patches/blob/master/dwm/dwm-barmodules-status2d-statuscmd-dwmblocks-extrastatus-6.2.diff)
* [dwm-barmodules-statusbutton-6.2.diff](https://github.com/bakkeby/patches/blob/master/dwm/dwm-barmodules-statusbutton-6.2.diff)
* [dwm-barmodules-systray-6.2.diff](https://github.com/bakkeby/patches/blob/master/dwm/dwm-barmodules-systray-6.2.diff)
* [dwm-barmodules-bartabgroups-6.2.diff](https://github.com/bakkeby/patches/blob/master/dwm/dwm-barmodules-bartabgroups-6.2.diff)
* [dwm-barmodules-taggrid-6.2.diff](https://github.com/bakkeby/patches/blob/master/dwm/dwm-barmodules-taggrid-6.2.diff)
* [dwm-barmodules-wintitleactions-6.2.diff](https://github.com/bakkeby/patches/blob/master/dwm/dwm-barmodules-wintitleactions-6.2.diff)