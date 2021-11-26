#!/usr/bin/env bash

# @Author: Gabrielvon
# @Date:   2021-11-24 09:56:41
# @Last Modified by:   Gabrielvon
# @Last Modified time: 2021-11-25 20:34:02


yum update -y && yum upgrade -y
yum install gcc gcc-c++ bzip2 m4 gmp-devel.x86_64  -y
git clone --branch nri https://github.com/NovelResearchInvestment/vnpy.git
python=$1
lprefix=$2
shift 2

[[ -z $python ]] && python=python
[[ -z $prefix ]] && prefix=/usr

$python -m pip install --upgrade pip setuptools wheel

# old versions of ta-lib imports numpy in setup.py
$python -m pip install numpy

# Install extra packages
# $python -m pip install ta-lib
$python -m pip install psycopg2-binary

# Install Python Modules
# $python -m pip install -r requirements.txt

# Install local Chinese language environment
locale-gen zh_CN.GB18030

# Install vn.py
$python -m pip install .