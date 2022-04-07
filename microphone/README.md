The Framework laptop microphone is sensitive, but unfortunately a little too sensitive--people can hear background noise.

I use rnnoise and pipewire to create a 2nd virtual microphone that has reduced background noise.

## Setup

1. wget https://github.com/werman/noise-suppression-for-voice/releases/download/v0.91/linux_rnnoise_bin_x64.tar.gz
    a. tar -xzvf linux_rnnoise_bin_x64.tar.gz
2. mkdir ~/.local/share/rnnoise
3. cp bin/ladspa/librnnoise_ladspa.so ~/.local/share/rnnoise
4. cp rnnoise.conf ~/.local/share/rnnoise/
5. mkdir -p ~/.config/systemd/user
6. cat <<-EOF >~/.config/systemd/user/rnnoise.service
[Unit]
Description=PipeWire Noise Filter
After=pipewire.service
BindsTo=pipewire.service

[Service]
ExecStart=/usr/bin/pipewire -c /home/duane/.local/share/rnnoise/rnnoise.conf
Type=simple
Restart=on-failure

[Install]
WantedBy=pipewire.service
EOF