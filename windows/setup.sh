#!/bin/bash

sudo apt-key add winehq.key
sudo add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ hirsute main'
sudo apt-get install --install-recommends winehq-devel
