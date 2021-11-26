# Dev Env on Ubuntu
#
# VERSION               0.1
# DOCKER-VERSION        0.2

FROM ubuntu
MAINTAINER "gabrielwfeng@gmail.com"
LABEL ORG="NRI"
WORKDIR /root
RUN apt update -y  && apt upgrade -y && apt install -y \
    curl \
    vim \
    && sh -c "$(curl -fsSL https://raw.githubusercontent.com/NovelResearchInvestment/nri_scripts/dev/ubuntu/ubuntu_setup.sh)"