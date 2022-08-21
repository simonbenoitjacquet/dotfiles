#!/usr/bin/env bash

# One liner that gives the directory of this script 
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Setup all symlinks
. "${SCRIPT_DIR}/symlinks-build.sh"

# Install core tools
# TODO: Install fzf with neovim
. "${SCRIPT_DIR}/neovim.sh"
sudo apt install -y tmux
. "${SCRIPT_DIR}/zsh.sh"

# Install extras
sudo apt install -y delta ripgrep fd-find fzf exa rust-bat

# Install languages
. "${SCRIPT_DIR}/python.sh"
. "${SCRIPT_DIR}/latex.sh"
