https://github.com/daitj/gnome-display-brightness-ddcutil/issues/1#issuecomment-753682414

$ nala install ddcutil

echo "alias br="sudo ddcutil --enable-capabilities-cache --noverify --sleep-multiplier 0.1 setvcp 0x10" >> ~/.bash_aliases

sudo cp /usr/share/ddcutil/data/45-ddcutils-i2c.rules /etc/udev/rules.d

sudo usermod your-user-name -aG i2c

reboot