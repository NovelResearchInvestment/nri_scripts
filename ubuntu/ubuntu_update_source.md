apt-get install vim

#备份配置文件
sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak
#打开文件
sudo vim /etc/apt/sources.list
#重开终端，查看版本代号
lsb_release -c
    #Ubuntu 12.04 (LTS)代号为precise
    #Ubuntu 14.04 (LTS)代号为trusty
    #Ubuntu 15.04 代号为vivid
    #Ubuntu 15.10 代号为wily
    #Ubuntu 16.04 (LTS)代号为xenial
    #Ubuntu 18.04 代号为bionic
    #Ubuntu 20.10 代号为groovy
    
#更新文件如下
deb http://mirrors.aliyun.com/ubuntu/ groovy main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ groovy main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ groovy-security main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ groovy-security main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ groovy-updates main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ groovy-updates main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ groovy-backports main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ groovy-backports main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ groovy-proposed main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ groovy-proposed main restricted universe multiverse
#更新文件列表
sudo apt-get update