#!/usr/bin/env bash

source utils.sh         # Get print and execute functions
source symlinks-list.sh # Get FILES_TO_SYMLINK and FOLDERS_TO_SYMLINK variables

link_file() {
  local sourceFile=$1
  local targetFile=$2

  # The target file does't exist
  if [ ! -e "$targetFile" ]; then
    execute "ln -fs $sourceFile $targetFile" "$targetFile → $sourceFile"

  # The target file exists and is already the right symlink
  elif [ "$(readlink "$targetFile")" == "$sourceFile" ]; then
    print_success "$targetFile → $sourceFile"

  # The target file already exists, do we keep it or replace it?
  else
    print_question "'$targetFile' already exists, do you want to overwrite it?"
    read -r -n 1
    printf "\n"
    if [[ "$REPLY" =~ ^[Yy]$ ]] ; then
      rm -rf "$targetFile"
      execute "ln -fs $sourceFile $targetFile" "$targetFile → $sourceFile"
    else
      print_error "$targetFile → $sourceFile"
    fi
  fi
}

# Symlink (or unlink) the dotfiles.
for i in "${FILES_TO_SYMLINK[@]}"; do
  sourceFile="$(pwd)/$i"
  targetFile="$HOME/.$(printf "%s" "$i" | sed "s/.*\/\(.*\)/\1/g")"
  link_file "$sourceFile" "$targetFile"
done


# Symlink (or unlink) folders in the ~/.config directory.
mkdir -p "${HOME}/.config"
for i in "${FOLDERS_TO_SYMLINK[@]}"; do
  sourceFile="$(pwd)/$i"
  targetFile="$HOME/.config/$(printf "%s" "$i" | sed "s/.*\/\(.*\)/\1/g")"
  link_file "$sourceFile" "$targetFile"
done

git config --global include.path ~/.main.gitconfig
