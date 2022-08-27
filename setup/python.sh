#!/usr/bin/env bash

# TODO: install python, jupyter notebook, pytorch, lsp-plugin
install_node() {
    curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
    sudo apt-get install -y nodejs
}  

install_python() {
    sudo apt install python3
    sudo apt-get install python3-pip
    sudo pip install notebook jupytext pyright
    sudo apt install -y nodejs npm npx
}

install_node
install_python

