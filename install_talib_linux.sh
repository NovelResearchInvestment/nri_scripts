# @Author: Gabrielvon
# @Date:   2021-07-26 14:52:27
# @Last Modified by:   Gabrielvon
# @Last Modified time: 2021-07-26 14:53:57

pushd /tmp
wget http://prdownloads.sourceforge.net/ta-lib/ta-lib-0.4.0-src.tar.gz
tar -xvf ta-lib-0.4.0-src.tar.gz
cd ta-lib
./configure --prefix=/usr
make -j
sudo make install
popd
sudo apt upgrade
pip install ta-lib
