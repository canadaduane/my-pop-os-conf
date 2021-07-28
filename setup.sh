# Install a few debian packages I like, but that are
# not available in Pop!_Shop:
wget -nc https://dl.winehq.org/wine-builds/winehq.key
sudo apt-key add winehq.key
sudo add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ hirsute main'
sudo add-apt-repository ppa:appimagelauncher-team/stable
sudo apt-get install --install-recommends winehq-devel xcape appimagelauncher
sudo apt update

# Make "CAPSLOCK" behave like "Escape" when pressed,
# and as Ctrl when held down + combined with another key
cat <<EOF > ~/.xprofile
setxkbmap -option ctrl:nocaps
xcape -e 'Control_L=Escape'
EOF

# Copy AutoKey configuration to correct location
cp -r ./autokey/ ~/.config/autokey/

# Remove some OS-level Super+KEY combinations so we can
# use AutoKey to make Pop-OS behave more like Mac OS
dconf load / <<ENDCONF
[org/gnome/settings-daemon/plugins/media-keys]
email=@as []
help=@as []
home=@as []
terminal=@as []
www=@as []

[org/gnome/shell/extensions/pop-shell]
focus-down=['<Super>KP_Down']
focus-left=['<Super>KP_Left']
focus-right=['<Super>KP_Right']
focus-up=['<Super>KP_Up']
tile-by-default=false

[org/gnome/shell/keybindings]
focus-active-notification=@as []
toggle-application-view=@as []
toggle-message-tray=@as []

[org/gnome/terminal/legacy/keybindings]
copy='<Primary><Shift>c'
paste='<Primary><Shift>v'
preferences='<Primary>comma'
select-all='<Primary><Shift>a'
ENDCONF

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
