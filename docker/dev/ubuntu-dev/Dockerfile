# Dev Env on Ubuntu
#
# VERSION               0.1
# DOCKER-VERSION        0.2

FROM ubuntu AS raw
LABEL maintainer="gabrielwfeng@gmail.com"
EXPOSE 80 443 7890
RUN mkdir -p /root/scripts/init_env
WORKDIR /root/scripts/init_env
RUN apt install curl &&
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/NovelResearchInvestment/nri_scripts/main/ubuntu/ubuntu_setup.sh)"



