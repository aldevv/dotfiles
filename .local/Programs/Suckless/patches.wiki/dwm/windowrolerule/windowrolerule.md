Sometimes a single application opens different windows depending on the task at hand and this is
often reflected in the WM_WINDOW_ROLE(STRING) property.

This patch adds the role field to the rule configuration so that one can differentiate between,
say, Firefox "browser" vs "Preferences" vs "Manager" or Google-chrome "browser" vs "pop-up".

## Download
* [dwm-windowrolerule-6.2.diff](https://github.com/bakkeby/patches/blob/master/dwm/dwm-windowrolerule-6.2.diff)