# Dev Env on CentOS


FROM centos:latest
LABEL maintainer="gabrielwfeng@gmail.com"
LABEL ORG="NRI"
USER root
RUN yum update -y \
    && yum upgrade -y \
    && yum install -y \
    curl \
    && bash -c "$(curl -fsSL https://raw.githubusercontent.com/NovelResearchInvestment/nri_scripts/dev/centos/centos_setup.sh)" \
    && yum clean all \
    && rm -rf /var/cache/yum \
    && echo "\n\n\nNRI-CENTOS SETUP DONE" 
CMD [ "/bin/bash" ]