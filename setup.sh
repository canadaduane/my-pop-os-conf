sudo apt update

./appimage/setup.sh
./windows/setup.sh

./gnome-extensions/blur-my-shell.sh

# Make "CAPSLOCK" behave like "Escape" when pressed,
# and as Ctrl when held down + combined with another key
cat <<EOF > ~/.xprofile
setxkbmap -option ctrl:nocaps
xcape -e 'Control_L=Escape'
EOF


# Dock preferences (centered, at bottom)
dconf load / <<ENDCONF
[org/gnome/shell/extensions/dash-to-dock]
dash-max-icon-size=48
dock-fixed=true
dock-position='BOTTOM'
extend-height=false
intellihide=false
manualhide=false
show-mounts=true
ENDCONF
