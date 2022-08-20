#!/usr/bin/env bash

# This is the one-liner installation script for these dotfiles. It gets the 
# the file with curl and executes it directly with bash. To install, run
# the following command:
# bash <(curl -L https://raw.githubusercontent.com/simonbenoitjacquet/dotfiles/master/dotfiles.sh)

{ # This ensures the entire script is downloaded.

  basedir=$HOME/.dotfiles
  repourl=https://github.com/simonbenoitjacquet/dotfiles.git

  # Install git
  if ! command -v git >/dev/null ; then
    # TODO: Test this implementation
    echo "Git is not installed!"
    echo "Installing git"
    sudo apt install git-all
  fi

  # Download dotfiles
  if [ -d "$basedir/.git" ]; then
    cd "$basedir" || exit
    git pull --quiet --rebase origin master
  else
    rm -rf "$basedir"
    git clone --quiet --filter=blob:none "$repourl" "$basedir"
  fi

  # Launch setupscript
  cd "$basedir" || exit
  # shellcheck source=setup.sh
  # . setup.sh -t build
  . setup/build.sh

} # This ensures the entire script is downloaded.
