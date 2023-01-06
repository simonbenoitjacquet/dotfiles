install_pip_requirements() {
    pip --upgrade install pip
    # Torch related packages
    pip install torch
    pip install fastai
    pip install pytorch-lightning
    # Tensorflow related packages
    pip install tensorflow
    pip install keras
    # Other packages
    pip install transformer # HuggingFace transformers
    pip install kaggle      # Kaggle interface
}

install_nvidia_drivers() {
    sudo ubuntu-drivers autoinstall
}

install_pip_requirements
install_nvidia_drivers
