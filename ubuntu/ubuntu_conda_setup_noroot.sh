#!/bin/bash

CONDA_PREFIX=$HOME/conda
mkdir -p $CONDA_PREFIX

get_curdir () {
    local curdir="$(cd "$(dirname "$0")" && pwd)"
    echo $curdir
}

install_miniconda () {
    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O $CONDA_PREFIX/miniconda.sh
    bash $CONDA_PREFIX/miniconda.sh -b -u -p $CONDA_PREFIX
    rm -rf $CONDA_PREFIX/miniconda.sh
    $CONDA_PREFIX/bin/conda init zsh
}

# slient mode
# install_miniconda > /dev/null 2>&1

# logging mode
install_miniconda > "$(get_curdir)/miniconda_install.log"

# clean up
$CONDA_PREFIX/bin/conda clean --all -f -y 
echo "miniconda installed in [$CONDA_PREFIX]"