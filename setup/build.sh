#!/usr/bin/env bash

# One liner that gives the directory of this script 
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Setup all symlinks
. "${SCRIPT_DIR}/symlinks-build.sh"

# Install extras
sudo apt-get install -y delta
sudo apt-get install -y ripgrep
sudo apt-get install -y fd-find
sudo apt-get install -y fzf
sudo apt-get install -y exa
sudo apt-get install -y rust-bat
sudo apt-get install -y unzip

# Install languages
. "${SCRIPT_DIR}/python.sh"
. "${SCRIPT_DIR}/latex.sh"

# Install core tools
# TODO: Install fzf with neovim
. "${SCRIPT_DIR}/neovim.sh"
sudo apt-get install -y tmux
. "${SCRIPT_DIR}/zsh.sh"
. "${SCRIPT_DIR}/i3.sh"
