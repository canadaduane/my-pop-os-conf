# Emoji & Unicode key combos (Ctrl-Shift-E, -U) and how to disable

For the longest time, I couldn't figure out why `Ctrl-Shift-E` shortcut key in my dev environment (VSCodium) didn't work. While investigating, for example, the custom keybindings area in VSCodium would report "unknown" when I typed the key combo--as if it didn't understand it as a shortcut key combination at all.

It turns out there is an app called [ibus](https://github.com/ibus/ibus/wiki) (Intelligent Input Bus) that takes the `Ctrl-Shift-E` shortcut key combo by default and lets you write emojis with it. For example: in a text editor (or GTK-based app such as Terminal), type `Ctrl-Shift-E` and then type "smile", followed by `spacebar`, and then press `enter`. A smiley-face emoji should appear.

I don't need this utility, and I especially want to free up the `Ctrl-Shift-E` key combo for VSCodium (because by default, this shortcut in VSCodium is supposed to switch to the Explorer pane).

To disable it, go to your command-line (e.g. Meta key, `Terminal`) and type `ibus-setup`. A GUI dialog will pop up allowing you to configure the shortcut keys in the "Emoji" tab.

I just remove them both, and now I'm good to go.