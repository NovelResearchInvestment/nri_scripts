# /bin/sh

yum update -y && yum upgrade -y
yum install bzip2 -y

mkdir -p ~/miniconda3

install_miniconda () {
    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
    bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
    rm -rf ~/miniconda3/miniconda.sh
    ~/miniconda3/bin/conda init bash
    ~/miniconda3/bin/conda init zsh
}

# slient mode
# install_miniconda > /dev/null 2>&1

# logging mode
install_miniconda > ~/miniconda3/miniconda_install.log