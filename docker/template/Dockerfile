# Dev Env on CentOS
#
# VERSION               0.1
# DOCKER-VERSION        0.2

FROM centos AS raw

LABEL maintainer="gabrielwfeng@gmail.com"

EXPOSE 80 443 7890

# make sure the package repository is up to date
RUN mkdir -p /scripts/startup
WORKDIR /scripts/startup
COPY centos_setup.sh centos_setup.sh
COPY .tmux.conf tmux.conf
COPY .zshrc .zshrc
WORKDIR /root
RUN sh /scripts/startup/centos_setup.sh
# RUN yum update -y && \
#     yum upgrade -y && \
#     yum install -y vim git curl wget tree zsh tmux jq && \
#     yum instal
#     yum clean all
# RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/NovelResearchInvestment/nri_scripts/main/centos/centos_setup.sh)"

# RUN ["sh centos_setup.sh"]
# RUN ["/bin/bash", "-c", "bash <(curl https://raw.githubusercontent.com/NovelResearchInvestment/nri_scripts/main/centos/centos_setup.sh)"]

# FROM raw
