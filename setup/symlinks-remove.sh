#!/usr/bin/env bash

source utils.sh         # Get print and execute functions
source symlinks-list.sh # Get FILES_TO_SYMLINK and FOLDERS_TO_SYMLINK variables

unlink_file() {
  local sourceFile=$1
  local targetFile=$2

  if [ "$(readlink "$targetFile")" == "$sourceFile" ]; then
    execute "unlink $targetFile" "unlink $targetFile"
  fi
}

# Symlink (or unlink) the dotfiles.
for i in "${FILES_TO_SYMLINK[@]}"; do
  sourceFile="$(pwd)/$i"
  targetFile="$HOME/.$(printf "%s" "$i" | sed "s/.*\/\(.*\)/\1/g")"
  unlink_file "$sourceFile" "$targetFile"
done


# Symlink (or unlink) folders in the ~/.config directory.
for i in "${FOLDERS_TO_SYMLINK[@]}"; do
  sourceFile="$(pwd)/$i"
  targetFile="$HOME/.config/$(printf "%s" "$i" | sed "s/.*\/\(.*\)/\1/g")"
  unlink_file "$sourceFile" "$targetFile"
done

git config --global --unset include.path
