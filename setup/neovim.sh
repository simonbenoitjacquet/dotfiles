#!/usr/bin/env bash

install_prerequisite() {
  sudo apt-get install fuse libfuse2 
}

install_neovim() {
  if [ -z "$(command -v nvim)" ]; then
    cd ~
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
    chmod u+x ./nvim.appimage 
    ./nvim.appimage && (
         sudo mv nvim.appimage /usr/bin/nvim
    ) || (
      ./nvim.appimage --app-extract ;
      ~/squashfs-root/usr/bin/nvim ;
      sudo mv ~/squashfs-root/usr/bin/nvim /usr/bin/nvim
    );
  fi;
}

install_prerequisite
install_neovim
