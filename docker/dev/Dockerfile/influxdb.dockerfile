# Dev Env on CentOS
#
# VERSION               0.1
# DOCKER-VERSION        0.2

FROM gabrielvon/centos-nri:1.0.1
MAINTAINER "gabrielwfeng@gmail.com"
LABEL ORG="NRI"
EXPOSE 80 443 8086
WORKDIR /root
RUN yum update -y && yum upgrade -y \
    && wget https://dl.influxdata.com/influxdb/releases/influxdb2-2.1.1-linux-amd64.tar.gz -P ~/downloads \
    && tar xvzf ~/downloads/influxdb2-2.1.1-linux-amd64.tar.gz -C ~/downloads \
    && cp ~/downloads/influxdb2-2.1.1-linux-amd64/influxd /usr/local/bin/ \
    && rm -rf ~/downloads/influxdb2-* \
