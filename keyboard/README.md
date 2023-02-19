## Disable Super Key Launcher

By default on Pop! (and Gnome, generally) the system allows you to tap and release the "Super" key to go to the launcher (or overview mode, if configured). I don't like this, as I prefer the Mac way, where you press Cmd+Space.

You can disable the single super key this way:

```
gsettings set org.gnome.mutter overlay-key ''
```

Then go to Settings -> Keyboard -> Keyboard Shortcuts -> View and Customize Shortcuts -> Navigate applications and windows -> Launch and switch applications; then, set up the key combo you would like.

## Remove ibus keymaps

There is a tool called `ibus` that takes control of Ctrl+Shift+E (emoji) and Ctrl+Shift+U (unicode) shortcut keys. See [my notes](ibus-emoji.md) for details.

To disable:
  - Run `ibus-setup` and remove these bindings.
  
## Experimental

It's possible to set the gnome terminal default keybindings this way:

```bash
# Configure Gnome Terminal to use KEY_COPY as the 'copy' key
# (instead of Ctrl+Shift+C)
dconf write /org/gnome/terminal/legacy/keybindings/copy "'Copy'"

# Configure Gnome Terminal to use KEY_PASTE as the 'paste' key
# (instead of Ctrl+Shift+V)
dconf write /org/gnome/terminal/legacy/keybindings/paste "'Paste'"
```

On a system without wayland or X:
- keymaps
- dumpkeys
- loadkeys

https://wayland-book.com/seat/xkb.html
