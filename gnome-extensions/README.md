# Gnome Extensions

Note: I use [Extension Manager](https://beta.flathub.org/apps/com.mattjakeman.ExtensionManager) via flatpak to manage Gnome extensions.

- [Burn My Windows](https://extensions.gnome.org/extension/4679/burn-my-windows/): Just for fun, this animates the window open/close transitions. I use `Apparition` on open and `TV Glitch` on close.
- [Dash to Dock for COSMIC](https://extensions.gnome.org/extension/5004/dash-to-dock-for-cosmic/): Provides a more Mac OS-like "dock" on the bottom of the screen, and makes it easier to manage multi-monitor setup.
- [Fullscreen Avoider](https://extensions.gnome.org/extension/4362/fullscreen-avoider/): Moves the top panel to the secondary monitor if the primary is in fullscreen. This lets me see the time, for example, while in a Zoom meeting.
- [Fullscreen Hot Corner](https://extensions.gnome.org/extension/1562/fullscreen-hot-corner/): Allows to use the upper-left "hot corner" to see workspaces overview, even while in full-screen mode.
- [One Thing](https://extensions.gnome.org/extension/5072/one-thing/): Allows me to type something into the top bar, to help me maintain my focus on a task.
- [Pano - Clipboard Manager](https://extensions.gnome.org/extension/5278/pano/): Excellent text & image clipboard manager
- [Vitals](https://extensions.gnome.org/extension/1460/vitals/) - Shows CPU, network in top bar

## Pop Shell

I like pop-shell, but don't like to have all of the configuration options available as a menu item in the taskbar, or even the ability to toggle tiling on/off. So I hide the pop-shell taskbar icon (it looks like 3 windows):

Comment out line 2127 of /usr/share/gnome-shell/extensions/pop-shell@system76.com/extension.js:

```
  //panel.addToStatusArea('pop-shell', indicator.button);
```
