yum update -y && yum upgrade -y
###
 # @Author: Gabriel Feng
 # @Date: 2021-12-17 09:27:34
 # @LastEditTime: 2021-12-17 09:27:35
 # @LastEditors: Gabriel Feng
 # @Description: 
 # @FilePath: \NRI\apps\nri_scripts\centos\install_softether.sh
 # -------------------------------------------------------------------------------
### 
yum -y install gcc zlib-devel openssl-devel readline-devel ncurses-devel
version=softether-vpnserver-v4.38-9760-rtm-2021.08.17-linux-x64-64bit.tar.gz
wget https://github.com/SoftEtherVPN/SoftEtherVPN_Stable/releases/download/v4.38-9760-rtm/$version
tar zxf $version
cd vpnserver
print "111" | make
./vpnserver start
# ./vpnserver stop
