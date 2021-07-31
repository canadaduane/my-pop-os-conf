# Install interception
sudo apt install libudev-dev libyaml-cpp-dev libevdev-dev cmake libboost-all-dev 

cd ~/Downloads
git clone https://gitlab.com/interception/linux/tools
(
    cd tools; mkdir build; cd build;
    cmake .. && make && sudo make install
)

git clone https://gitlab.com/interception/linux/plugins/caps2esc
(
    cd caps2esc; mkdir build; cd build;
    cmake .. && make && sudo make install
)

# Configure interception
sudo mkdir -p /etc/interception/udevmon.d/
sudo cp c2e.yaml /etc/interception/udevmon.d/c2e.yaml

# Configure udevmon, required by interception:
sudo cp udevmon.service /etc/systemd/system/
sudo systemctl enable --now udevmon
