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
