#!/bin/bash

set -x

systemctl stop udevmon

gcc macos_musclemem.cc -o macos_musclemem &&
    cp macos_musclemem /usr/local/bin/ &&
    cp macos_musclemem.yaml /etc/interception/udevmon.d/

systemctl start udevmon