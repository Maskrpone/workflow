#!/usr/bin/env bash

set -eu -o pipefail

path="/home/$USER"

echo $path

sudo -n true
test $? -eq 0 || exit 1 "you should have sudo privilege to run this script"

echo "Refreshing mirrors ..."

sudo pacman -Sy --noconfirm

echo "Installing paru ..."

git clone https://aur.archlinux.org/paru



echo "installing various packages..."
while read -r p ; do sudo pacman -S --noconfirm $p ; done < <(cat << "EOF"
    ttf-meslo-nerd
    sof-firmware
    pavucontrol
    bluez
    bluez-utils
    blueberry
    alacritty
    neovim
    firefox
EOF
)






