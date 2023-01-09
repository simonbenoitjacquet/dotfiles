#!/usr/bin/env bash

install_i3() {
    sudo apt install -y i3
}  
install_nitrogen() {
    # Handles background
    sudo apt install -y nitrogen
}
install_picom() {
    # Transparency
    sudo apt install -y picom
}
install_others() {
    sudo apt install -y gimp
    sudo apt install -y pavucontrol
    sudo apt install -y zathura
    sudo apt install -y xsel
    sudo apt install -y maim
    pip install autotiling=1.8
    sudo mv $(which autotiling) /usr/bin
}
remove_terminal_topbar() {
    gsettings set org.gnome.Terminal.Legacy.Settings headerbar "@mb false"
}

install_i3
install_nitrogen
install_picom
remove_terminal_topbar
install_others
