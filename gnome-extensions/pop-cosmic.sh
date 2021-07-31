#!/bin/bash

POP_COSMIC_EXT="/usr/share/gnome-shell/extensions/pop-cosmic@system76.com"

# Swap the top panel icons on the right-hand side, so that
# the login icons are on the far right and the datetime is to
# the left of it.
#
# NOTE: This only works if the pop-cosmic extension has
#   `clock-alignment` set to RIGHT aligned.
sudo patch -p1 $POP_COSMIC_EXT/extension.js <<EOF
71c71
< 	Main.panel._rightBox.add_actor(container);
---
>         Main.panel._rightBox.insert_child_at_index(container, 1);
EOF

# Set clock-alignment to RIGHT aligned, amidst other prefs.
dconf load / <<ENDCONF
[org/gnome/shell/extensions/pop-cosmic]
clock-alignment='RIGHT'
overlay-key-action='LAUNCHER'
show-workspaces-button=false
ENDCONF
