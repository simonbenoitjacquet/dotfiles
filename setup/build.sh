#!/usr/bin/env bash

# Setup all symlinks
. symlinks-build.sh

# Install core tools
# TODO: Install fzf with neovim
sudo apt install -y neovim tmux
. zsh.sh

# Install extras
sudo apt install -y delta ripgrep fd-find fzf exa rust-bat

# Install languages
. python.sh
. latex.sh
