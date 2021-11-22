# Dev Env on CentOS
#
# VERSION               0.1
# DOCKER-VERSION        0.2

FROM centos AS raw
LABEL maintainer="gabrielwfeng@gmail.com"
EXPOSE 80 443 7890
RUN mkdir -p /root/scripts/init_env
WORKDIR /root/scripts/init_env
RUN yum update -y  && yum upgrade -y && yum install -y \
    curl \
    vim \
    && sh -c "$(curl -fsSL https://raw.githubusercontent.com/NovelResearchInvestment/nri_scripts/dev/centos/centos_setup.sh)"