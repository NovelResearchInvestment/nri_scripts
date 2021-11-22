# Dev Env on Ubuntu
#
# VERSION               0.1
# DOCKER-VERSION        0.2

FROM ubuntu AS raw
LABEL maintainer="gabrielwfeng@gmail.com"
EXPOSE 80 443 7890
RUN mkdir -p /root/scripts/init_env
WORKDIR /root/scripts/init_env
RUN apt update -y  && apt upgrade -y && apt install -y \
    curl \
    vim \
    && sh -c "$(curl -fsSL https://raw.githubusercontent.com/NovelResearchInvestment/nri_scripts/dev/ubuntu/ubuntu_setup.sh)"