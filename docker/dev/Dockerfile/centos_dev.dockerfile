# Dev Env on CentOS
#
# VERSION               0.1
# DOCKER-VERSION        0.2

FROM centos:latest
MAINTAINER "gabrielwfeng@gmail.com"
LABEL ORG="NRI"
WORKDIR /root
RUN yum update -y && yum upgrade -y && yum install -y \
    curl \
    vim \
    && sh -c "$(curl -fsSL https://raw.githubusercontent.com/NovelResearchInvestment/nri_scripts/dev/centos/centos_setup.sh)"