# Gnome Extensions

- [Burn My Windows](https://extensions.gnome.org/extension/4679/burn-my-windows/): Nice effects when opening and closing windows
- [Dash to Dock for COSMIC](https://extensions.gnome.org/extension/5004/dash-to-dock-for-cosmic/): A better App dock for the edge of the screen
- [Fullscreen Avoider](https://extensions.gnome.org/extension/4362/fullscreen-avoider/): Moves the top panel to the secondary monitor if the primary is in fullscreen
- [Fullscreen Hot Corner](https://extensions.gnome.org/extension/1562/fullscreen-hot-corner/): Enables hot corner in fullscreen mode
- [One Thing](https://extensions.gnome.org/extension/5072/one-thing/): Lets you type a reminder or other text to yourself in the top panel
- [Pano - Clipboard Manager](https://extensions.gnome.org/extension/5278/pano/): Excellent text & image clipboard manager

## Pop Shell

I like pop-shell, but don't like to have all of the configuration options available as a menu item in the taskbar, or even the ability to toggle tiling on/off. So I hide the pop-shell taskbar icon (it looks like 3 windows):

Comment out line 2127 of /usr/share/gnome-shell/extensions/pop-shell@system76.com/extension.js:

```
  //panel.addToStatusArea('pop-shell', indicator.button);
```
