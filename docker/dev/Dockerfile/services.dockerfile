# Dev Env on CentOS
#
# VERSION               0.1
# DOCKER-VERSION        0.2

FROM gabrielvon/centos-nri:1.0.1
MAINTAINER "gabrielwfeng@gmail.com"
LABEL ORG="NRI"
EXPOSE 80 443 8086
WORKDIR /root