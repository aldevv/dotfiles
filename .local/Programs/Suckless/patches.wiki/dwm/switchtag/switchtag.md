By default dwm has client rules where the tag(s) the client starts up on can be defined.

This patch adds another client rule (switchtag) that allow for the view to also change to that of
the newly started client and, optionally, move back to the previous tag selection when the client
is closed.

Also see the [switchtotag](https://dwm.suckless.org/patches/switchtotag/) patch.

## Rules

**switchtag**

* 0 is default behaviour, view is not changed
* 1 automatically moves you to the tag of the newly opened application
* 2 enables the tag of the newly opened application in addition to your existing enabled tags
* 3 as 1, but closing that window reverts the view back to what it was before opening the client *
* 4 as 2, but closing that window reverts the view back to what it was before opening the client *

(* except if the client has been moved between tags or to another monitor)

## Download
* [dwm-switchtag-6.2.diff](https://github.com/bakkeby/patches/blob/master/dwm/dwm-switchtag-6.2.diff)