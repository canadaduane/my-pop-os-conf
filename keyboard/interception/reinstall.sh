#!/bin/bash

set -x

systemctl stop udevmon

gcc meta_mac.cc -o meta_mac &&
    cp meta_mac /usr/local/bin/ &&
gcc swap_super_alt.cc -o swap_super_alt &&
    cp swap_super_alt /usr/local/bin/ &&
gcc caps2esc.cc -o caps2esc &&
    cp caps2esc /usr/local/bin/ &&
cp udevmon.yaml /etc/interception/udevmon.yaml &&
cp clipboard_keys.yaml /etc/interception/clipboard_keys.yaml

systemctl start udevmon