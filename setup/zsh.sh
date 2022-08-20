#!/usr/bin/env bash

install_zsh() {
  # Test to see if zsh is installed.
  if [ -z "$(command -v zsh)" ]; then
    # If zsh isn't installed, get the platform of the current machine and
    # install zsh with the appropriate package manager.
    platform=$(uname);
    if [[ $platform == 'Linux' ]]; then
      if [[ -f /etc/redhat-release ]]; then
        sudo yum install zsh
      fi
      if [[ -f /etc/debian_version ]]; then
        sudo apt-get -y install zsh
      fi
    elif [[ $platform == 'Darwin' ]]; then
      brew install zsh
    fi
  fi
  # Set the default shell to zsh if it isn't currently set to zsh
  if [[ ! "$SHELL" == "$(command -v zsh)" ]]; then
    sudo chsh -s "$(command -v zsh)"
  fi
}

install_zsh_extras() {
  # Clone Oh My Zsh if it isn't already present
  if [[ ! -d $HOME/.oh-my-zsh/ ]]; then
    git clone --filter=blob:none https://github.com/robbyrussell/oh-my-zsh.git "$HOME/.oh-my-zsh"
  fi
  # Clone Powerlevel10k if it isn't already present.
  if [[ ! -d $HOME/.oh-my-zsh/custom/themes/powerlevel10k ]]; then
    git clone --filter=blob:none \
      --branch v1.16.1 \
      https://github.com/romkatv/powerlevel10k.git \
      "$HOME/.oh-my-zsh/custom/themes/powerlevel10k"
  fi
  ft_path=${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fzf-tab
  if [[ ! -d ${ft_path} ]]; then
    git clone --filter=blob:none \
      https://github.com/Aloxaf/fzf-tab \
      "${ft_path}"
  fi
  fsh_path=${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
  if [[ ! -d ${fsh_path} ]]; then
    git clone --filter=blob:none \
      https://github.com/zdharma-continuum/fast-syntax-highlighting.git \
      "${fsh_path}"
  fi
}

install_zsh
install_zsh_extras
