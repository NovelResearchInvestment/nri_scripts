# Dev Env on CentOS


FROM centos:latest
LABEL maintainer="gabrielwfeng@gmail.com"
LABEL ORG="NRI"
USER root
WORKDIR /root
COPY /apps/nri_scripts/centos/centos_setup.sh centos_setup.sh
RUN yum update -y \
    && yum upgrade -y \
    && yum install -y \
    curl \
    && bash centos_setup.sh \
    && rm centos_setup.sh \
    && yum clean all \
    && rm -rf /var/cache/yum \
    && echo "\n\n\nNRI-CENTOS SETUP DONE" 
CMD [ "/bin/bash" ]