# Dev Env on CentOS


FROM centos:latest
LABEL maintainer="gabrielwfeng@gmail.com"
LABEL ORG="NRI"
USER root
WORKDIR /root
ENV TZ=Asia/Shanghai
RUN yum update -y && yum upgrade -y && yum install curl -y \
    && bash -c "$(curl -fsSL https://raw.githubusercontent.com/NovelResearchInvestment/nri_scripts/dev/centos/centos_setup.sh)" \
    && yum clean all \
    && rm -rf /var/cache/yum
CMD [ "/bin/zsh" ]