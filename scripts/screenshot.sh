#!/bin/bash
name=$(date | tr ' :' _)
longname="$HOME/Pictures/$name.png"
maim --select $longname
