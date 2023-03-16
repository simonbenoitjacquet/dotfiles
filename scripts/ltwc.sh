#!/bin/bash
# Launch terminal with command
# All arguments are concatenated in a single command
gnome-terminal -- zsh -c "$*;$SHELL"
