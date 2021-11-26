# Dev Env on Ubuntu
#
# VERSION               0.1
# DOCKER-VERSION        0.2

FROM jupyterhub/k8s-hub:1.1.3-n195.h8ec28343
MAINTAINER "gabrielwfeng@gmail.com"
LABEL ORG="NRI"
USER root
EXPOSE 80 443 8081 8080 8000
WORKDIR /root
RUN apt-get update -y  && apt-get upgrade -y && apt-get install -y \
    curl \
    vim \
    nodejs \
    npm \
    && npm install -g configurable-http-proxy \
    && sh -c "$(curl -fsSL https://raw.githubusercontent.com/NovelResearchInvestment/nri_scripts/dev/ubuntu/ubuntu_setup.sh)"
CMD ["jupyterhub"]