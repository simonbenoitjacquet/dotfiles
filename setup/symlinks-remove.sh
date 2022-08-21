#!/usr/bin/env bash

# One liner that gives the directory of this script 
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source "${SCRIPT_DIR}/utils.sh"         # Get BASEDIR, print and execute functions
source "${SCRIPT_DIR}/symlinks-list.sh" # Get FILES_TO_SYMLINK and FOLDERS_TO_SYMLINK variables

unlink_file() {
  local sourceFile=$1
  local targetFile=$2

  if [ "$(readlink "$targetFile")" == "$sourceFile" ]; then
    execute "unlink $targetFile" "unlink $targetFile"
  fi
}

# Symlink (or unlink) the dotfiles.
for i in "${FILES_TO_SYMLINK[@]}"; do
  sourceFile="$BASEDIR/$i"
  targetFile="$HOME/.$(printf "%s" "$i" | sed "s/.*\/\(.*\)/\1/g")"
  unlink_file "$sourceFile" "$targetFile"
done


# Symlink (or unlink) folders in the ~/.config directory.
for i in "${FOLDERS_TO_SYMLINK[@]}"; do
  sourceFile="$BASEDIR/$i"
  targetFile="$HOME/.config/$(printf "%s" "$i" | sed "s/.*\/\(.*\)/\1/g")"
  unlink_file "$sourceFile" "$targetFile"
done

git config --global --unset include.path
