#!/bin/bash

DOWNLOAD_DIR="/tmp"
LATEST_RNNOISE="https://github.com/werman/noise-suppression-for-voice/releases/download/v0.91/linux_rnnoise_bin_x64.tar.gz"
SHARE_DIR="$HOME/.local/share/rnnoise"
CONFIG_DIR="$HOME/.config/systemd/user"

mkdir -p "$SHARE_DIR"
mkdir -p "$CONFIG_DIR"

echo "Downloading & installing librnnoise_ladspa.so to '$SHARE_DIR'"
cd "$DOWNLOAD_DIR"
wget "$LATEST_RNNOISE" && \
tar -xzvf linux_rnnoise_bin_x64.tar.gz && \
cp bin/ladspa/librnnoise_ladspa.so "$SHARE_DIR" || \
    exit 1 # fail if any of the above failed

echo "Creating pipewire filter config file at '$SHARE_DIR/pipewire-filter.conf' ..."
cat <<EOF >"$SHARE_DIR/pipewire-filter.conf"
# Noise canceling source
#
context.properties = {
    log.level        = 0
}

context.spa-libs = {
    audio.convert.* = audioconvert/libspa-audioconvert
    support.*       = support/libspa-support
}

context.modules = [
    {   name = libpipewire-module-rt
        args = {
            #nice.level   = -11
            #rt.prio      = 88
            #rt.time.soft = 200000
            #rt.time.hard = 200000
        }
        flags = [ ifexists nofail ]
    }
    {   name = libpipewire-module-protocol-native }
    {   name = libpipewire-module-client-node }
    {   name = libpipewire-module-adapter }

    {   name = libpipewire-module-filter-chain
        args = {
            node.name =  "rnnoise_source"
            node.description =  "Voice Mic"
            media.name =  "Voice Mic"
            filter.graph = {
                nodes = [
                    {
                        type = ladspa
                        name = rnnoise
                        plugin = ${SHARE_DIR}/librnnoise_ladspa.so
                        label = noise_suppressor_stereo
                        control = {
                            "VAD Threshold (%)" 50.0
                        }
                    }
                ]
            }
            capture.props = {
                node.passive = true
            }
            playback.props = {
                media.class = Audio/Source
            }
        }
    }
]
EOF

echo "Creating systemd unit file at '$CONFIG_DIR/noise-filtered-mic-source.service' ..."
cat <<EOF >"$CONFIG_DIR/noise-filtered-mic-source.service"
[Unit]
Description=PipeWire Noise Filtered Mic Source
After=pipewire.service
BindsTo=pipewire.service

[Service]
ExecStart=/usr/bin/pipewire -c "$SHARE_DIR/pipewire-filter.conf"
Type=simple
Restart=on-failure

[Install]
WantedBy=pipewire.service
EOF

echo "Enabling and immediately starting the systemd service..."
systemctl enable --user --now noise-filtered-mic-source.service
