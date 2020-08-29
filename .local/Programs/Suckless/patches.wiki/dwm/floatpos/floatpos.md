The floatpos patch was primarily intended as a more flexible replacement for the
[floatrules](https://dwm.suckless.org/patches/floatrules/) patch which, at the time of writing,
only supports absolute `x` and `y` values which is less than optimal in a multi-monitor setup.

The patch was expanded to support changing the size and position of floating windows, potentially making it a replacement candidate for the [exresize](https://dwm.suckless.org/patches/exresize/),
[moveplace](https://dwm.suckless.org/patches/moveplace/) and
[moveresize](https://dwm.suckless.org/patches/moveresize/) patches.

In addition floating windows can be positioned/moved on the screen in a grid-like manner.

## Features
* monitor size agnostic positioning options for new floating windows
* control the size and position of floating windows using keyboard shortcuts
* position floating windows in a grid-like manner

## Rules of the game

This patch accepts two or four values on the form of `<value><char>`, where `<value>` typically indicates change whereas the `<char>` represents the context of said change.

These generally represents the `x` and `y` coordinates and the `width` and `height` dimensions, in that order.

An example would be `"50% 50% 800W 800H"`, indicating to center the client on both the x and y axis while specifying a fixed width and height of 800 pixels.

### Coordinates char meaning

* `A` - absolute position in the drawable area (this spans all monitors)
* `a` - absolute position relative to the client's current position
* `X` - position relative to monitor
* `x` - position relative to client
* `%` - specifies the client's mid-point in percentage relative to the window area height / width
* `S` - the client's current x / y position is fixed (sticky)
    * if value is -1 then width / height indicators determines the size of the client
    * otherwise the value indicates the next position, determining the size of the client
    * this can, as an example, be used to "maximize" a client from it's current position to the edge of the screen
* `C` - as above, but the client's mid-point (center) is fixed (sticky)
    * this is typically used when resizing clients, making them expand or contract in all directions
* `Z` - as above, but the opposite side of the client is fixed (sticky) (i.e. client position + size)
* `G` - indicates that the monitor is split into a grid on which points the client can be positioned
    * the value defines the size of the grid, if value is 0 then grid dimensions from config is used

NB: in general all positions are restricted to the current monitor, unless absolute positioning is used.

### Dimensions char meaning

* `A` - absolute height / width
* `a` - relative height / width
* `H` - defines height of client, but position can take precedence
* `h` - defines height relative to client size
* `W` - defines width of client, but position can take predecence
* `w` - defines width relative to client size
* `%` - size determined in percentage of the monitor's window area
* `P` - absolute grid position
* `p` - relative grid position

NB: while generally not important the size of the client is inclusive of the window border.

For convenience it is possible to only pass in two values rather than four, which are interpreted as follows:

* `<number><w/W> <number><h/H>` (resize) - x and y coordinates default to `-1C` resulting in the client expanding / contracting
* `<number><p/P> <number><p/P>` (grid position) - x and y coordinates default to `0G` resulting in grid dimensions from config to be used
* otherwise the values are interpreted as x and y coordinates


## Example keybindings

Due to the likelihood of conflicts with other functionality these example keybindings are using a `mod3` modifier.
If you do not already have such a modifier on your keyboard then you can add one using `xmodmap`, here is an example changing the right Control key to be a `mod3` key.

```
xmodmap -e "clear control" -e "add control = Control_L" -e "clear mod3" -e "add mod3 = Control_R"
```

These examples are using a numpad-like layout to demonstrate directional adjustment of floating windows.

```
↖↑↗
←·→
↙↓↘
```


### Example 1: Moving a window using keyboard shortcuts

```
{ Mod3Mask,                     XK_u,        floatpos,   {.v = "-26x -26y" } }, // ↖
{ Mod3Mask,                     XK_i,        floatpos,   {.v = "  0x -26y" } }, // ↑
{ Mod3Mask,                     XK_o,        floatpos,   {.v = " 26x -26y" } }, // ↗
{ Mod3Mask,                     XK_j,        floatpos,   {.v = "-26x   0y" } }, // ←
{ Mod3Mask,                     XK_l,        floatpos,   {.v = " 26x   0y" } }, // →
{ Mod3Mask,                     XK_m,        floatpos,   {.v = "-26x  26y" } }, // ↙
{ Mod3Mask,                     XK_comma,    floatpos,   {.v = "  0x  26y" } }, // ↓
{ Mod3Mask,                     XK_period,   floatpos,   {.v = " 26x  26y" } }, // ↘
```
Relatively straightforward, x and y postions are adjusted in the given directions by 26 pixels relative to the client's current position. Width and height remains as-is.

Note that the client position is restricted to the monitor's window area, which means that it won't overlap the bar (if present) and it can't move over to an adjacent monitor.


### Example 2: Moving a window using absolute positioning

```
{ Mod3Mask|ShiftMask|ControlMask,  XK_u,        floatpos,   {.v = "-26a -26a" } }, // ↖
{ Mod3Mask|ShiftMask|ControlMask,  XK_i,        floatpos,   {.v = "  0a -26a" } }, // ↑
{ Mod3Mask|ShiftMask|ControlMask,  XK_o,        floatpos,   {.v = " 26a -26a" } }, // ↗
{ Mod3Mask|ShiftMask|ControlMask,  XK_j,        floatpos,   {.v = "-26a   0a" } }, // ←
{ Mod3Mask|ShiftMask|ControlMask,  XK_l,        floatpos,   {.v = " 26a   0a" } }, // →
{ Mod3Mask|ShiftMask|ControlMask,  XK_m,        floatpos,   {.v = "-26a  26a" } }, // ↙
{ Mod3Mask|ShiftMask|ControlMask,  XK_comma,    floatpos,   {.v = "  0a  26a" } }, // ↓
{ Mod3Mask|ShiftMask|ControlMask,  XK_period,   floatpos,   {.v = " 26a  26a" } }, // ↘
```

This is exactly the same as example 1 except that the position is absolute and the window can overlap the bar and move over to an adjacent monitor.


### Example 3: Resizing a client

```
{ Mod3Mask|ShiftMask,           XK_u,        floatpos,   {.v = "-26w -26h" } }, // ↖
{ Mod3Mask|ShiftMask,           XK_i,        floatpos,   {.v = "  0w -26h" } }, // ↑
{ Mod3Mask|ShiftMask,           XK_o,        floatpos,   {.v = " 26w -26h" } }, // ↗
{ Mod3Mask|ShiftMask,           XK_j,        floatpos,   {.v = "-26w   0h" } }, // ←
{ Mod3Mask|ShiftMask,           XK_k,        floatpos,   {.v = "800W 800H" } }, // ·
{ Mod3Mask|ShiftMask,           XK_l,        floatpos,   {.v = " 26w   0h" } }, // →
{ Mod3Mask|ShiftMask,           XK_m,        floatpos,   {.v = "-26w  26h" } }, // ↙
{ Mod3Mask|ShiftMask,           XK_comma,    floatpos,   {.v = "  0w  26h" } }, // ↓
{ Mod3Mask|ShiftMask,           XK_period,   floatpos,   {.v = " 26w  26h" } }, // ↘
```

Here the height and width of the client is adjusted depending on the direction. Notably `u` and `.` changes size in both directions whereas `o` and `m` increases one dimension while decreasing the other. The center key `k` sets the client to an absolute height and width of 800 pixels.

The coordinates here are not provided and defaults to `-1C` causing the client to stay in place when the size changes.

The size of the client is restricted to the monitor's window area, try increasing the size of a window close to the border.


### Example 4: Maximize the client in any given direction

```
{ Mod3Mask|Mod1Mask,            XK_u,        floatpos,   {.v = " 0Z  0Z   0%   0%" } }, // ↖
{ Mod3Mask|Mod1Mask,            XK_i,        floatpos,   {.v = " 0x  0Z   0%   0%" } }, // ↑
{ Mod3Mask|Mod1Mask,            XK_o,        floatpos,   {.v = "-1S  0Z 100%   0%" } }, // ↗
{ Mod3Mask|Mod1Mask,            XK_j,        floatpos,   {.v = " 0Z  0y   0%   0%" } }, // ←
{ Mod3Mask|Mod1Mask,            XK_k,        floatpos,   {.v = "50% 50%  50%  50%" } }, // ·
{ Mod3Mask|Mod1Mask,            XK_l,        floatpos,   {.v = "-1S  0y 100%   0%" } }, // →
{ Mod3Mask|Mod1Mask,            XK_m,        floatpos,   {.v = " 0Z -1S   0% 100%" } }, // ↙
{ Mod3Mask|Mod1Mask,            XK_comma,    floatpos,   {.v = " 0x -1S   0% 100%" } }, // ↓
{ Mod3Mask|Mod1Mask,            XK_period,   floatpos,   {.v = "-1S -1S 100% 100%" } }, // ↘
```

These instructions may look cryptic and confusing, but they are examples combining fixed client borders with either a size change or position change. The center `k` shortcut sets the client to be centered on the screen taking up 50% of the available space.

In principle these could all be written using only position changes, e.g. `m` could be written as `"0Z 9999S"` rather than `"0Z -1S 0% 100%"`. Similarly the keys of `u`, `i` and `j` are only positional changes so the `0% 0%` bit is superfluous. While this could be simplified it has been left as-is for demonstration purposes.


### Example 5: Positioning floating windows on an artificial grid

```
{ Mod3Mask|ControlMask|Mod1Mask,  XK_u,        floatpos,   {.v = "-1p -1p" } }, // ↖
{ Mod3Mask|ControlMask|Mod1Mask,  XK_i,        floatpos,   {.v = " 0p -1p" } }, // ↑
{ Mod3Mask|ControlMask|Mod1Mask,  XK_o,        floatpos,   {.v = " 1p -1p" } }, // ↗
{ Mod3Mask|ControlMask|Mod1Mask,  XK_j,        floatpos,   {.v = "-1p  0p" } }, // ←
{ Mod3Mask|ControlMask|Mod1Mask,  XK_k,        floatpos,   {.v = " 0p  0p" } }, // ·
{ Mod3Mask|ControlMask|Mod1Mask,  XK_l,        floatpos,   {.v = " 1p  0p" } }, // →
{ Mod3Mask|ControlMask|Mod1Mask,  XK_m,        floatpos,   {.v = "-1p  1p" } }, // ↙
{ Mod3Mask|ControlMask|Mod1Mask,  XK_comma,    floatpos,   {.v = " 0p  1p" } }, // ↓
{ Mod3Mask|ControlMask|Mod1Mask,  XK_period,   floatpos,   {.v = " 1p  1p" } }, // ↘
```

The configuration specifies a default grid size of 5x5 (`floatposgrid_x` / `floatposgrid_y` variables). The keybindings here change the position of the client relative to it's current position.

The column and row positions of the grid is relative to the client's size, and the current position in the grid is derived from the x and y coordinates of the client.


### Example 6: Corner and center positioning of client

```
{ Mod3Mask|ControlMask,         XK_u,        floatpos,   {.v = "  0%   0%" } }, // ↖
{ Mod3Mask|ControlMask,         XK_i,        floatpos,   {.v = " 50%   0%" } }, // ↑
{ Mod3Mask|ControlMask,         XK_o,        floatpos,   {.v = "100%   0%" } }, // ↗
{ Mod3Mask|ControlMask,         XK_j,        floatpos,   {.v = "  0%  50%" } }, // ←
{ Mod3Mask|ControlMask,         XK_k,        floatpos,   {.v = " 50%  50%" } }, // ·
{ Mod3Mask|ControlMask,         XK_l,        floatpos,   {.v = "100%  50%" } }, // →
{ Mod3Mask|ControlMask,         XK_m,        floatpos,   {.v = "  0% 100%" } }, // ↙
{ Mod3Mask|ControlMask,         XK_comma,    floatpos,   {.v = " 50% 100%" } }, // ↓
{ Mod3Mask|ControlMask,         XK_period,   floatpos,   {.v = "100% 100%" } }, // ↘
```

This example positions the floating client in any of the four corners, the four edge centers or in the middle of the screen.


### Example 7: Corner and center positioning of client using a grid

```
{ Mod3Mask|ShiftMask|Mod1Mask,  XK_u,        floatpos,   {.v = "3G 3G 1P 1P" } }, // ↖
{ Mod3Mask|ShiftMask|Mod1Mask,  XK_i,        floatpos,   {.v = "3G 3G 2P 1P" } }, // ↑
{ Mod3Mask|ShiftMask|Mod1Mask,  XK_o,        floatpos,   {.v = "3G 3G 3P 1P" } }, // ↗
{ Mod3Mask|ShiftMask|Mod1Mask,  XK_j,        floatpos,   {.v = "3G 3G 1P 2P" } }, // ←
{ Mod3Mask|ShiftMask|Mod1Mask,  XK_k,        floatpos,   {.v = "3G 3G 2P 2P" } }, // ·
{ Mod3Mask|ShiftMask|Mod1Mask,  XK_l,        floatpos,   {.v = "3G 3G 3P 2P" } }, // →
{ Mod3Mask|ShiftMask|Mod1Mask,  XK_m,        floatpos,   {.v = "3G 3G 1P 3P" } }, // ↙
{ Mod3Mask|ShiftMask|Mod1Mask,  XK_comma,    floatpos,   {.v = "3G 3G 2P 3P" } }, // ↓
{ Mod3Mask|ShiftMask|Mod1Mask,  XK_period,   floatpos,   {.v = "3G 3G 3P 3P" } }, // ↘
```

This does exactly the same as example 6, by using explicit positions on a 3x3 grid.

## Example client rules

```
/* class      instance    title       tags mask     isfloating   floatpos                 monitor */
{ "e1",       NULL,       NULL,       0,            1,           "0x 0y 800W 800H",       -1 },
{ "e2",       NULL,       NULL,       0,            1,           "9999X 0y 800W 800H",    -1 },
{ "e3",       NULL,       NULL,       0,            1,           "0x 9999y 800W 800H",    -1 },
{ "e4",       NULL,       NULL,       0,            1,           "9999x 9999y 800W 800H", -1 },
{ "e5",       NULL,       NULL,       0,            1,           "-1x -1y 9999W 800H",    -1 },
{ "e6",       NULL,       NULL,       0,            1,           "-1x 9999y 9999W 800H",  -1 },
{ "e7",       NULL,       NULL,       0,            1,           "-1x -1y 800W 9999H",    -1 },
{ "e8",       NULL,       NULL,       0,            1,           "9999x -1y 800W 9999H",  -1 },
{ "e9",       NULL,       NULL,       0,            1,           "50% 50% 800W 800H",     -1 },
{ "e10",      NULL,       NULL,       0,            1,           "-1x -1y 50% 50%",       -1 },
{ "e11",      NULL,       NULL,       0,            1,           "0% 0% 800W 800H",       -1 },
{ "e12",      NULL,       NULL,       0,            1,           "100% 0% 800W 800H",     -1 },
{ "e13",      NULL,       NULL,       0,            1,           "0% 100% 800W 800H",     -1 },
{ "e14",      NULL,       NULL,       0,            1,           "100% 100% 800W 800H",   -1 },
{ "e15",      NULL,       NULL,       0,            1,           "-1x -1y 100% 800H",     -1 },
{ "e16",      NULL,       NULL,       0,            1,           "-1x 100% 100% 800H",    -1 },
{ "e17",      NULL,       NULL,       0,            1,           "-1x -1y 800W 100%",     -1 },
{ "e18",      NULL,       NULL,       0,            1,           "100% -1y 800W 100%",    -1 },
{ "e19",      NULL,       NULL,       0,            1,           "50% 50% 50% 50%",       -1 },
{ "e20",      NULL,       NULL,       0,            1,           NULL,                    -1 },
```

The above example rules are meant for testing purposes and can be triggered by running, e.g. `st -c e4`.


## Download
* [dwm-floatpos-6.2.diff](https://github.com/bakkeby/patches/blob/master/dwm/dwm-floatpos-6.2.diff)
