# /bin/bash
###
 # @Author: Gabriel Feng
 # @Date: 2021-11-26 13:54:47
 # @LastEditTime: 2021-12-15 10:08:05
 # @LastEditors: Gabriel Feng
 # @Description: 
 # @FilePath: \NRI\apps\nri_scripts\centos\centos_conda_setup.sh
 # -------------------------------------------------------------------------------
### 

yum update -y && yum upgrade -y
yum install bzip2 -y

CONDA_PREFIX=/opt/conda
mkdir -p $CONDA_PREFIX

install_miniconda () {
    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O $CONDA_PREFIX/miniconda.sh
    bash $CONDA_PREFIX/miniconda.sh -b -u -p $CONDA_PREFIX
    rm -rf $CONDA_PREFIX/miniconda.sh
    $CONDA_PREFIX/bin/conda init zsh
}

# slient mode
# install_miniconda > /dev/null 2>&1

# logging mode
install_miniconda > $CONDA_PREFIX/miniconda_install.log

# clean up
$CONDA_PREFIX/bin/conda clean --all -f -y 
yum remove bzip2 -y
yum clean all
rm -rf /var/cache/yum

echo "miniconda installed in [$CONDA_PREFIX]"