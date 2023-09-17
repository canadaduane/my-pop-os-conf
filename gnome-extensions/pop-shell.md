I like pop-shell, but don't like to have all of the configuration options available as a menu item in the taskbar, or even the ability to toggle tiling on/off. So I hide the pop-shell taskbar icon (it looks like 3 windows):

Comment out line 2118 of /usr/share/gnome-shell/extensions/pop-shell@system76.com/extension.js:

```
  //panel.addToStatusArea('pop-shell', indicator.button);
```
