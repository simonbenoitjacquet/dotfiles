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
install_others() {
    sudo apt-get install -y gimp
    sudo apt-get install -y pavucontrol
    sudo apt-get install -y zathura
}
remove_terminal_topbar() {
    gsettings set org.gnome.Terminal.Legacy.Settings headerbar "@mb false"
}

install_i3
install_nitrogen
install_picom
remove_terminal_topbar
install_others
