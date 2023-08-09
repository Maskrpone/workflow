#!/usr/bin/env bash

echo "<==== Neovim configuration ====>";

git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim;

echo "packer installed...";

ln -sf $1/.dotfiles/nvim $1/.config/nvim

echo "neovim configuration done !";
