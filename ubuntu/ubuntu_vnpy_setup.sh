#!/bin/bash

sudo apt-get update -y
sudo apt-get upgrade -y 
sudo apt-get install locales g++

# # install python3 using miniconda and create vnpy env
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/NovelResearchInvestment/nri_scripts/dev/centos/centos_conda_setup.sh)"
# conda init zsh && source ~/.zshrc
# conda create -n vnpy python=3.7 -y
# conda activate vnpy

# # install talib from conda
# conda install -c conda-forge ta-lib

python=$1
prefix=$2
shift 2

[[ -z $python ]] && python=python
[[ -z $prefix ]] && prefix=$HOME/NRI/infrastructure/vnpy_framework/vnpy

mkdir -p $prefix
# $python -m pip install --upgrade libpq-dev python-dev
# echo "199.232.68.133 raw.githubusercontent.com" >> /etc/hosts
git clone --branch nri https://github.com/NovelResearchInvestment/vnpy.git $prefix

$python -m pip install --upgrade pip setuptools wheel 
$python -m pip install --upgrade psycopg2-binary

# Install Python Modules
$python -m pip install -r $prefix/requirements.txt

# Install local Chinese language environment
apt-get install -y locales
locale-gen zh_CN.GB18030
# echo "export LANG=C.UTF-8" >> /etc/profile
# source /etc/profile

# Install vn.py
$python -m pip install $prefix/.