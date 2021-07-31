# Download blur-my-shell
(cd ~/Downloads && wget https://extensions.gnome.org/extension-data/blur-my-shellaunetx.v22.shell-extension.zip)

# Install
gnome-extensions install ~/Downloads/blur-my-shellaunetx.v22.shell-extension.zip

# Must restart gnome-shell before new extension will be recognized
killall -SIGQUIT gnome-shell

# Enable
gnome-extensions enable blur-my-shell@aunetx
