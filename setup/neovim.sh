#!/usr/bin/env bash

install_neovim() {
  if [ -z "$(command -v nvim)" ]; then
    cd ~
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
    chmod u+x ./nvim.appimage 
    ./nvim.appimage || (
      ./nvim.appimage --app-extract ;
      ~/squashfs-root/usr/bin/nvim ;
    );
  fi;
}

install_neovim
