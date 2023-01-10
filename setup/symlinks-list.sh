#!/usr/bin/env bash

FILES_TO_SYMLINK=(
  'git/gitattributes'
  'git/main.gitconfig'
  'git/gitignore'

  'home_config/ignore'
  'home_config/ripgreprc'
  'home_config/tmux.conf'
  'home_config/vimrc'
  'home_config/zshrc'
  'home_config/p10k.zsh'
  'home_config/xinitrc'
  'home_config/Xmodmap'
)

FOLDERS_TO_SYMLINK=(
  'xdg_config/nvim'
  'xdg_config/i3'
  'xdg_config/i3status'
  'xdg_config/picom'
  'xdg_config/fd'
)
