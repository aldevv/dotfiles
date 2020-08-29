There exists a feature rich layout called [flextile](https://dwm.suckless.org/patches/flextile/)
which incorporates and expands on a few other layouts/patches:
* [rmaster](https://dwm.suckless.org/patches/rmaster/) - allows you to swap the position of the
  master and stack area
* [bottomstack](https://dwm.suckless.org/patches/bottomstack/) - allows for master and stack area
  to be split horizontally rather than vertically
* [deck](https://dwm.suckless.org/patches/deck/) - allows for a monocle like view in the stack area
* [pertag](https://dwm.suckless.org/patches/pertag/) - includes a bespoke or old version of pertag
* [nmaster](https://dwm.suckless.org/patches/nmaster/) - controls the number of clients in the
  master area (this was incorporated in later versions of dwm)

The patch then has keybindings that allow you to rotate between the different splits, i.e.
horizontal or vertical split, as well as keybindings to change how each of the master and stack
areas are arranged (columns, rows, or stacked).

The patch was created for dwm-5.8.2 more than 10 years ago, but can still be ported if necessary.

The flextile patch gave rise to some interesting ideas like:
> _What if the way clients are arranged is entirely unrelated to how the master and stack area is
  split?_

This eventually led to flextile-deluxe, a re-envisoned, flexible and over-the-top patch that
expands on flextile threefold.

## Features
* the layout (i.e. how the master and stack area is split) is separate from how clients are arranged
    * split vertically (like the default tile layout)
    * split vertically with a dual stack area
    * split horizontally (like the bottom stack layouts)
    * split horizontally with a dual stack area
    * centered vertical split (like the centered master layout)
    * centered horizontal split
    * floating master
    * fixed splits (master area does not change size depending on the number of clients)
    * no split (like the monocle layout)
* mirror layout (swaps position of master and stack area, like rmaster)
* client tile arrangement are on a per area basis
    * arrange left to right (columns)
    * arrange top to bottom (rows)
    * stacked (monocle / deck)
    * fixed grid (gridmode)
    * gappless grid
    * horizontal grid
    * fibonacci (dwindle / spiral)
* all arrangements have gaps support
* all arrangements have cfacts support
* pertag integration
* cycle through the layout (split) using keyboard shortcuts
* cycle through the tile arrangement on a per area basis using keyboard shortcuts
* optionally expand control with [dwmc](https://dwm.suckless.org/patches/dwmc/) /
  [fsignal](https://dwm.suckless.org/patches/fsignal/) support

## Setup

With this patch the layouts array has an additional array of parameters.

The default example layouts set up with this patch are as follows:

```c
static const Layout layouts[] = {
	/* symbol     arrange function, { nmaster, nstack, layout, master axis, stack axis, secondary stack axis, symbolfunc } */
	{ "[]=",      flextile,         { -1, -1, SPLIT_VERTICAL, TOP_TO_BOTTOM, TOP_TO_BOTTOM, 0, NULL } }, // default tile layout
	{ "><>",      NULL,             {0} },    /* no layout function means floating behavior */
	{ "[M]",      flextile,         { -1, -1, NO_SPLIT, MONOCLE, 0, 0, NULL } }, // monocle
	{ "|||",      flextile,         { -1, -1, SPLIT_VERTICAL, LEFT_TO_RIGHT, TOP_TO_BOTTOM, 0, NULL } }, // columns (col) layout
	{ ">M>",      flextile,         { -1, -1, FLOATING_MASTER, LEFT_TO_RIGHT, LEFT_TO_RIGHT, 0, NULL } }, // floating master
	{ "[D]",      flextile,         { -1, -1, SPLIT_VERTICAL, TOP_TO_BOTTOM, MONOCLE, 0, NULL } }, // deck
	{ "TTT",      flextile,         { -1, -1, SPLIT_HORIZONTAL, LEFT_TO_RIGHT, LEFT_TO_RIGHT, 0, NULL } }, // bstack
	{ "===",      flextile,         { -1, -1, SPLIT_HORIZONTAL, LEFT_TO_RIGHT, TOP_TO_BOTTOM, 0, NULL } }, // bstackhoriz
	{ "|M|",      flextile,         { -1, -1, SPLIT_HORIZONTAL, LEFT_TO_RIGHT, TOP_TO_BOTTOM, 0, monoclesymbols } }, // centeredmaster
	{ ":::",      flextile,         { -1, -1, NO_SPLIT, GAPPLESSGRID, 0, 0, NULL } }, // gappless grid
	{ "[\\]",     flextile,         { -1, -1, NO_SPLIT, DWINDLE, 0, 0, NULL } }, // fibonacci dwindle
	{ "(@)",      flextile,         { -1, -1, NO_SPLIT, SPIRAL, 0, 0, NULL } }, // fibonacci spiral
};
```

These simulate the corresponding individual patches of
[columns](https://dwm.suckless.org/patches/columns/),
[centeredmaster](https://dwm.suckless.org/patches/centeredmaster/),
[deck](https://dwm.suckless.org/patches/deck/),
[bottomstack](https://dwm.suckless.org/patches/bottomstack/),
[gaplessgrid](https://dwm.suckless.org/patches/gaplessgrid/) and
[fibonacci](https://dwm.suckless.org/patches/fibonacci/) layouts.

### Layout configuration

**symbol** - this is the symbol that is used when the layout is set
   * note that when rotating through layouts and tile arrangements the layout symbol used is
     derived from the current configuration

**arrange function** - this is the function that handles the layout arrangements
   * for flextile deluxe this is all controlled by the `flextile` function
   * a value of `NULL` means floating layout (as per dwm default)

**nmaster** - this allows for the number of clients in the master area to be defined on a
   per-layout basis
   * in practice this works best if _all_ layouts specify a value here
   * a value of `-1` makes the layout use the existing `nmaster` value

**nstack** - this allows for the number of clients in the primary stack area to be defined on a
   per-layout basis
   * this is specifically for dual stack layouts such as centered master, as an example
   * a value of `-1` makes the layout use the existing `nstack` value

**layout** - this defines how the window area is split
   * `NO_SPLIT` - window area has no split
      * used for monocle view, or to simulate original gaplessgrid or fibonacci layouts
   * `SPLIT_VERTICAL` - window area is split vertically (as with original tile layout)
   * `SPLIT_HORIZONTAL` - window area is split horizontally (as with the bottomstack layouts)
   * `SPLIT_CENTERED_VERTICAL` - as with the centered master layout
      * this results in two stack areas, one on each side of the master layout
      * by default, unless `nstack` is set, stack clients are divided between the two stack areas
   * `SPLIT_CENTERED_HORIZONTAL` - as above, just with a horizontal split
      * intended for vertical monitors
   * `SPLIT_VERTICAL_DUAL_STACK` - as with default tile layout, but the stack area is further split
      horizontally into two stack areas
   * `SPLIT_HORIZONTAL_DUAL_STACK` - as bottomstack layout, but the stack area is further split
      vertically into two stack areas
   * `FLOATING_MASTER` - this makes the master window(s) float (overlap) on top of the stack area
      * an example use case would be the centered floating master layout
   * `SPLIT_VERTICAL_FIXED` - fixed vertical split *
   * `SPLIT_HORIZONTAL_FIXED` - fixed horizontal split *
   * `SPLIT_CENTERED_VERTICAL_FIXED` - fixed vertical centered split *
   * `SPLIT_CENTERED_HORIZONTAL_FIXED` - fixed horizontal centered split *
   * `SPLIT_VERTICAL_DUAL_STACK_FIXED` - fixed vertical dual stack split *
   * `SPLIT_HORIZONTAL_DUAL_STACK_FIXED` - fixed horizontal dual stack split *
   * `FLOATING_MASTER_FIXED` - fixed floating master split *

(* All normal layouts reduce depending on the number of clients, e.g. for a centered master layout
   if there are three clients or more then the layout will contain a master area and two stack
   areas, but if there are two clients then a split similar to the default tile layout is shown. If
   there is only one client then that will take up the whole screen, like the monocle layout. The
   _fixed_ variants of these splits has no such reduction - a centered master layout with a single
   client will show the client in the master area with empty space where the stack clients would
   normally appear. These are intended for superwide monitors where one master window taking up the
   entirety of the monitor is not always ideal.)

**master axis** - controls how clients are arranged in the master area
**stack axis** - controls how clients are arranged in the primary stack area
**secondary stack axis** - controls how clients are arranged in the secondary stack area
   * `TOP_TO_BOTTOM` - clients are arranged top to bottom (i.e. rows)
   * `LEFT_TO_RIGHT` - clients are arranged left to right (i.e. columns)
   * `MONOCLE` - clients are stacked on top of each other (as in monocle or deck layouts)
   * `GAPPLESSGRID` - clients are arranged as per the [gaplessgrid](https://dwm.suckless.org/patches/gaplessgrid/) layout
   * `GAPPLESSGRID_ALT1` - alternate version that fills rows first
   * `GAPPLESSGRID_ALT2` - alternate version that fills columns first
   * `GRIDMODE` - clients are arranged as per the [gridmode](https://dwm.suckless.org/patches/gridmode/) layout
   * `HORIZGRID` - clients are arranged as per the [horizgrid](https://dwm.suckless.org/patches/horizgrid/) layout (i.e. max two rows)
   * `DWINDLE` - clients are arranged as per the [fibonacci](https://dwm.suckless.org/patches/fibonacci/) dwindle layout
   * `SPIRAL` - clients are arranged as per the [fibonacci](https://dwm.suckless.org/patches/fibonacci/) spiral layout

**symbolfunc** - allows for the handling of the layout symbol to be handed over to a dedicated function
   * this is only meant for special cases such as the layout symbol including the count of clients
     when in monocle layout

If non-flextile layouts are used then simply pass `{0}` for the remaining arguments, e.g.
```c
	{ "###",      nrowgrid,         {0} },
```

## fsignal / dwmc integration

For [fsignal](https://dwm.suckless.org/patches/fsignal/) and/or
[dwmc](https://dwm.suckless.org/patches/dwmc/) integration refer to the `setlayoutaxisex` function
in [dwm-flexipatch](https://github.com/bakkeby/dwm-flexipatch/blob/master/patch/layout_flextile-deluxe.c#L70-L87)
and the signal integration in [config.def.h](https://github.com/bakkeby/dwm-flexipatch/blob/master/config.def.h#L471-L474).

The `setlayoutaxisex` argument is a binary mask where:
   * the lower two bytes indicate whether the change is in relation to the layout (split), the
     master area, the primary stack or the secondary stack and
   * the remaining six upper bytes indicate arrangement

For the lower two bytes refer to the following enum:

```c
enum {
	LAYOUT,       // controls overall layout arrangement / split
	MASTER,       // indicates the tile arrangement for the master area
	STACK,        // indicates the tile arrangement for the stack area
	STACK2,       // indicates the tile arrangement for the secondary stack area
	LTAXIS_LAST,
};
```

For the layout arrangement refer to the split enum:

```c
enum {
	NO_SPLIT,
	SPLIT_VERTICAL,                    // master stack vertical split
	SPLIT_HORIZONTAL,                  // master stack horizontal split
	SPLIT_CENTERED_VERTICAL,           // centered master vertical split
	SPLIT_CENTERED_HORIZONTAL,         // centered master horizontal split
	SPLIT_VERTICAL_DUAL_STACK,         // master stack vertical split with dual stack
	SPLIT_HORIZONTAL_DUAL_STACK,       // master stack vertical split with dual stack
	FLOATING_MASTER,                   // (fake) floating master
	SPLIT_VERTICAL_FIXED,              // master stack vertical fixed split
	SPLIT_HORIZONTAL_FIXED,            // master stack horizontal fixed split
	SPLIT_CENTERED_VERTICAL_FIXED,     // centered master vertical fixed split
	SPLIT_CENTERED_HORIZONTAL_FIXED,   // centered master horizontal fixed split
	SPLIT_VERTICAL_DUAL_STACK_FIXED,   // master stack vertical split with fixed dual stack
	SPLIT_HORIZONTAL_DUAL_STACK_FIXED, // master stack vertical split with fixed dual stack
	FLOATING_MASTER_FIXED,             // (fake) fixed floating master
	LAYOUT_LAST,
};
```

For the master, primary and secondary stack arrangements, refer to the tile arrangements enum:

```c
enum {
	TOP_TO_BOTTOM,     // clients are arranged vertically
	LEFT_TO_RIGHT,     // clients are arranged horizontally
	MONOCLE,           // clients are arranged in deck / monocle mode
	GAPPLESSGRID,      // clients are arranged in a gappless grid (original formula)
	GAPPLESSGRID_ALT1, // clients are arranged in a gappless grid (alt. 1, fills rows first)
	GAPPLESSGRID_ALT2, // clients are arranged in a gappless grid (alt. 2, fills columns first)
	GRIDMODE,          // clients are arranged in a grid
	HORIZGRID,         // clients are arranged in a horizontal grid
	DWINDLE,           // clients are arranged in fibonacci dwindle mode
	SPIRAL,            // clients are arranged in fibonacci spiral mode
	AXIS_LAST,
};
```

To work out the argument to change the stack area to a gappless grid we combine the stack axis
`10` (2) with `11` (3) which gives a binary value of `00001110` (14).

Example to set the layout to be a centered master split:
```bash
xsetroot -name "fsignal:setlayoutaxisex i 12"
```

Decimal `12` is `00001100` in binary. The lower two bytes is `00` which means that this change is for
the layout (split).
The remaining upper six bytes is `000011` (decimal 3), indicating SPLIT_CENTERED_VERTICAL.

## Download
* [dwm-pertag-flextile_deluxe-6.2.diff](https://github.com/bakkeby/patches/blob/master/dwm/dwm-pertag-flextile_deluxe-6.2.diff)
