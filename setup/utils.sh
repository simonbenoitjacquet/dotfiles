#!/usr/bin/env bash

BASEDIR=$HOME/.dotfiles

print_success() {
  # Print output in green
  printf "\e[0;32m  [✔] $1 %s\e[0m\n"
}

print_error() {
  # Print output in red
  printf "\e[0;31m  [✖] %s %s\e[0m\n" "$1" "$2"
}

print_question() {
  # Print output in yellow
  printf "\e[0;33m  [?] %s\e[0m" "$1"
}

execute() {
  local command=$1
  local message=$2
  if [ $# -lt 2 ]; then
    message=$command
  fi

  # Execute command and redirects both stdout and stderr to the file /dev/null
  # If command succeeds, proceed with the success print, otherwise with the
  # error print
  eval "$command &> /dev/null" \
  && print_success $message \
  || print_error $message
}
