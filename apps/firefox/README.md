# two-finger stop on scroll

Currently, Firefox can't do a two-finger stop after two-finger scroll on a trackpad due to this open WIP:

https://gitlab.gnome.org/GNOME/gtk/-/merge_requests/3454

# cache

"Type about:config in the url and type `browser.cache.disk.enable` and set it to false. Now you can watch as many videos/streams as you want without causing multiple GBs of writes a day to your SSD." -- Sturmtruppa

# always open on current workspace

Firefox 75+ remembers the last workspace it was opened on as part of its session management. This is annoying, because I can have a blank workspace, click Firefox from the launcher, and then have Firefox open on some other workspace. To disable, in `about:config`:

```
widget.disable-workspace-management = true
```
