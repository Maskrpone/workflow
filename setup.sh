#!/usr/bin/env bash

set -eu -o pipefail

path="/home/$USER"

echo $path

sudo -n true
test $? -eq 0 || exit 1 "you should have sudo privilege to run this script"

echo "Refreshing mirrors ..."

sudo pacman -Sy --noconfirm

echo "installing various packages..."
while read -r p ; do sudo pacman -S --noconfirm $p ; done < <(cat << "EOF"
		obsidian
		tmux
		zsh
		neovim
		btop
		alacritty
EOF
)


echo "<==== Tmux setup ====>";

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm;

ln -sf $path/.dotfiles/.tmux.conf $path/.tmux.conf;

echo "tpm installed...";

echo "<=== Neovim configuration ===>";


