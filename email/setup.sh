#!/bin/bash

# By default, the flatpak sandbox prevents exporting email and "Print to File"
# from saving to the actual host filesystem. Open up the `home` filesystem,
# i.e. /home/duane/* for Evolution to export/save to:
flatpak override --user --filesystem=home org.gnome.Evolution

# Install my fav shortcut keys
CONFIG_DIR="$HOME/.var/app/org.gnome.Evolution/config/evolution"
mkdir -p "$CONFIG_DIR"
cp evolution.accels "$CONFIG_DIR/accels"
