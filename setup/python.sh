#!/usr/bin/env bash

# TODO: install python, jupyter notebook, pytorch, lsp-plugin
install_node() {
    curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
    sudo apt-get install -y nodejs
}  

install_python() {
    sudo apt install python3
    sudo apt-get install python3-pip

    sudo apt install -y nodejs npm npx

    sudo pip install notebook jupytext pyright
    jupyter labextension install jupyterlab-jupytext@1.2.2  # For Jupyter Lab 2.x

    pip install jupyter_ascending && \
    jupyter nbextension    install --user jupyter_ascending --sys-prefix --py && \
    jupyter nbextension     enable jupyter_ascending --sys-prefix --py && \
    jupyter serverextension enable jupyter_ascending --sys-prefix --py
}

install_node
install_python

