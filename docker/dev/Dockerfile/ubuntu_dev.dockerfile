# Dev Env on Ubuntu


FROM ubuntu
LABEL maintainer="gabrielwfeng@gmail.com"
LABEL ORG="NRI"
USER root
WORKDIR /root
ENV TZ=Asia/Shanghai
RUN apt-get update -qq && apt-get upgrade -y \
    && apt-get install -y -qq --no-install-recommends \
    curl \
    && sh -c "$(curl -fsSL https://raw.githubusercontent.com/NovelResearchInvestment/nri_scripts/dev/ubuntu/ubuntu_setup.sh)" \
    && apt-get autoremove -y -qq \
    && apt-get clean -qq
CMD [ "/bin/zsh" ]