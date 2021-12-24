# Dev Env on Ubuntu


FROM ubuntu
LABEL maintainer="gabrielwfeng@gmail.com"
LABEL ORG="NRI"
USER root
WORKDIR /home/dev
# COPY /apps/nri_scripts/ubuntu/ubuntu_setup.sh ubuntu_setup.sh
COPY /ubuntu/ubuntu_setup.sh ubuntu_setup.sh
RUN apt-get update -qq && apt-get upgrade -y \
    && apt-get install -y -qq --no-install-recommends \
    curl \
    && bash ubuntu_setup.sh \
    # && bash -c "$(curl -fsSL https://raw.githubusercontent.com/NovelResearchInvestment/nri_scripts/dev/ubuntu/ubuntu_setup.sh)" \
    && rm ubuntu_setup.sh \
    && apt-get autoremove -y -qq \
    && apt-get clean -qq
CMD [ "/bin/zsh" ]