#!/usr/bin/env bash

# This is the one-liner installation script for these dotfiles. It gets the 
# the file with curl and executes it directly with bash. To install, run
# the following command:
# bash <(curl -L https://raw.githubusercontent.com/simonbenoitjacquet/dotfiles/master/dotfiles.sh)

{ # This ensures the entire script is downloaded.

  BASEDIR=$HOME/.dotfiles
  REPOURL=https://github.com/simonbenoitjacquet/dotfiles.git

  # Install git
  if ! command -v git >/dev/null ; then
    sudo apt install git
  fi

  # Download dotfiles
  if [ -d "$BASEDIR/.git" ]; then
    cd "$BASEDIR" || exit
    git pull --quiet --rebase origin master
  else
    rm -rf "$BASEDIR"
    git clone --quiet --filter=blob:none "$REPOURL" "$BASEDIR"
  fi

  # Launch setupscript
  cd "$BASEDIR" || exit
  # shellcheck source=setup.sh
  # . setup.sh -t build
  . "${BASEDIR}/setup/build.sh"

} # This ensures the entire script is downloaded.
