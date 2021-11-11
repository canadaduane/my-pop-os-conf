# Download blur-my-shell
(cd ~/Downloads && wget https://extensions.gnome.org/extension-data/clipboard-indicatortudmotu.com.v37.shell-extension.zip)

# Install
gnome-extensions install ~/Downloads/clipboard-indicatortudmotu.com.v37.shell-extension.zip

# Must restart gnome-shell before new extension will be recognized
killall -SIGQUIT gnome-shell

# Enable
gnome-extensions enable clipboard-indicator@tudmotu.com
