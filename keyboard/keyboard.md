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

## Remove ibus keymaps

There is a tool called `ibus` that takes control of Ctrl+Shift+E (emoji) and Ctrl+Shift+U (unicode) shortcut keys. See [my notes](ibus-emoji.md) for details.

To disable:
  - Run `ibus-setup` and remove these bindings.