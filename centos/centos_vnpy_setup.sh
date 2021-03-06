#!/bin/bash


yum update -y
yum upgrade -y
yum install gcc gcc-c++ locales -y

# # install python3
# yum install python3 -y
# yum install python38 -y
# yum install epel-release
# yum install python37 python-pip
# echo "alias python='python3'" >> ~/.zshrc
# source ~/.zshrc

# # install python3 using miniconda and create vnpy env
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/NovelResearchInvestment/nri_scripts/dev/centos/centos_conda_setup.sh)"
# source ~/.zshrch
# conda create -n vnpy python=3.7 -y
# conda activate vnpy

# # install talib from conda
# conda install -c conda-forge ta-lib

python=$1
prefix=$2
shift 2

[[ -z $python ]] && python=python
[[ -z $prefix ]] && prefix=~/Repos/NRI/infrastructure/vnpy_framework/vnpy

mkdir -p $prefix
# echo "199.232.68.133 raw.githubusercontent.com" >> /etc/hosts
git clone --branch nri https://github.com/NovelResearchInvestment/vnpy.git $prefix

$python -m pip install --upgrade pip setuptools wheel 
$python -m pip install --upgrade psycopg2-binary

# Install Python Modules
$python -m pip install -r $prefix/requirements.txt --no-cache-dir

# Install local Chinese language environment
locale-gen zh_CN.GB18030

# Install vn.py
$python -m pip install $prefix/. --no-cache-dir
yum clean all && rm -rf /var/cache/yum