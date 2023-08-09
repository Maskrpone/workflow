#!/usr/bin/env bash

echo "<==== Tmux setup ====>";

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm;

ln -sf $1/.dotfiles/.tmux.conf $1/.tmux.conf;

echo "tpm installed...";
