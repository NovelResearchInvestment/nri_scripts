# Dev Env on Ubuntu
#
# VERSION               0.1
# DOCKER-VERSION        0.2

FROM gabrielvon/centos-nri:1.0.1
MAINTAINER "gabrielwfeng@gmail.com"
LABEL ORG="NRI"
WORKDIR /root/downloads/
RUN yum install \
    git \
    bzip2 \
    && curl -O https://repo.anaconda.com/archive/Anaconda3-5.3.1-Linux-x86_64.sh
    && printf 'yyy' | bash Anaconda3-5.3.1-Linux-x86_64.sh \
    && conda info

WORKDIR /root/Repos/
