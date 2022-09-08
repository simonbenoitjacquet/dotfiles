#!/usr/bin/env bash

install_i3() {
    sudo apt-get install -y i3
}  
install_nitrogen() {
    # Handles background
    sudo apt-get install -y nitrogen
}
install_picom() {
    # Transparency
    sudo apt-get install -y picom
}
remove_terminal_topbar() {
    gsettings set org.gnome.Terminal.Legacy.Settings headerbar "@mb false"
}

install_i3
install_nitrogen
install_picom
remove_terminal_topbar
