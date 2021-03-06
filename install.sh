#!/bin/bash

# Install packages
sudo apt install hostapd dnsmasq iproute2 iw
# sudo systemctl stop dnsmasq
# sudo systemctl disable dnsmasq
# sudo systemctl stop hostapd
# sudo systemctl disable hostapd

# Environment variables and directories
printenv | grep "/home/`whoami`/.local/bin" > /dev/null 2>&1 || \
	echo "export PATH=$PATH:$HOME/.local/bin" >> $HOME/.bashrc
printenv | grep "/home/`whoami`/.local/bin" > /dev/null 2>&1 || \
	export PATH=$PATH:$HOME/.local/bin
mkdir -p $HOME/{.local/{etc,bin},.config/hotspot}

# Installation
curl --compressed -sfL "https://raw.githubusercontent.com/kevydotvinu/WiFiRepeater/master/hotspot" > "$HOME/.local/bin/hotspot" || echo "Download Failed"
chmod +x $HOME/.local/bin/hotspot
