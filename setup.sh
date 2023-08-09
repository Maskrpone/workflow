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
    ttf-meslo-nerd
EOF
)

git clone https://aur.archlinux.org/yay-git.git && cd ~/.dotfiles/yay-git/ && makepkg -si

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)";

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k;


exec ./tmux.sh $path

exec ./nvim.sh $path
