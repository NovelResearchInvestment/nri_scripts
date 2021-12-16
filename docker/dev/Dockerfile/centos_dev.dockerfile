# Dev Env on CentOS
#

FROM centos:latest
LABEL maintainer="gabrielwfeng@gmail.com"
LABEL ORG="NRI"
ENV TZ=Asia/Shanghai
WORKDIR /root
RUN yum update -y && yum upgrade -y && yum install curl -y \
    && bash -c "$(curl -fsSL https://raw.githubusercontent.com/NovelResearchInvestment/nri_scripts/dev/centos/centos_setup.sh)" \
    && yum clean all \
    && rm -rf /var/cache/yum