#!/usr/bin/env bash

FILES_TO_SYMLINK=(
  'git/gitattributes'
  'git/main.gitconfig'
  'git/gitignore'

  'HOME_config/ignore'
  'HOME_config/ripgreprc'
  'HOME_config/tmux.conf'
  'HOME_config/vimrc'
  'HOME_config/zshrc'
  'HOME_config/p10k.zsh'
  'HOME_config/xinitrc'
  'HOME_config/Xmodmap'
)

FOLDERS_TO_SYMLINK=(
  'XDG_config/nvim'
  'XDG_config/i3'
  'XDG_config/i3status'
)
