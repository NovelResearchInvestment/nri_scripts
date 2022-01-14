ARG BASE_CONTAINER=$OWNER/scipy-notebook
# ARG HOME=/home/${NB_USER}
# FROM jupyter/scipy-notebook
# FROM jupyter/base-notebook

FROM jupyter/minimal-notebook
LABEL maintainer="gabrielwfeng@gmail.com"
LABEL ORG="NRI"
USER root
WORKDIR ${HOME}
RUN echo "${NB_USER}:nr!${NB_USER}${NB_UID}" | chpasswd

RUN apt-get update -qq \
    && apt-get upgrade -y \
    && apt-get install -y -qq --no-install-recommends \
    apt-utils \
    curl \
    zsh \
    tmux \
    gcc \
    python3-dev \
    && conda init bash \
    && echo \
    && echo \
    && echo

ARG NRI_CONDA_NAME=nri
ARG NRI_CONDA_PREFIX=${CONDA_DIR}/envs/${NRI_CONDA_NAME}
RUN echo "CONDA NRI ENVIRONMENT SETUP --- STEP 0: UPDATE BASE ENV" \
    && conda update -n base -c defaults conda -y \
    && ${CONDA_DIR}/bin/python -m ipykernel install --name base \
    && echo "CONDA NRI ENVIRONMENT SETUP --- STEP 1: CREATE ENV" \
    && conda create -n ${NRI_CONDA_NAME} python=3.8 ipykernel -y \
    && ${NRI_CONDA_PREFIX}/bin/python -m ipykernel install --name ${NRI_CONDA_NAME} \
    && echo "CONDA NRI ENVIRONMENT SETUP --- STEP 2: INSTALL PUBLIC PACKAGES" \
    && ${NRI_CONDA_PREFIX}/bin/python -m pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple \
    && ${NRI_CONDA_PREFIX}/bin/python -m pip install -U git+https://github.com/NovelResearchInvestment/akshare.git --no-cache --no-cache-dir >/dev/null \
    && ${NRI_CONDA_PREFIX}/bin/python -m pip install -U git+https://github.com/NovelResearchInvestment/corpwechatbot.git --no-cache --no-cache-dir >/dev/null \
    && conda install -n ${NRI_CONDA_NAME} -c conda-forge ta-lib 

COPY wheels /nri_quant/wheels
COPY requirements.txt /nri_quant/requirements.txt
WORKDIR /nri_quant/wheels
RUN echo "CONDA NRI ENVIRONMENT SETUP --- STEP 3: INSTALL LOCAL PACKAGES" \
    && echo "listdir: $(ls -alt)" \
    && ${NRI_CONDA_PREFIX}/bin/python -m pip install -vUr /nri_quant/requirements.txt --no-cache --no-cache-dir \
    && ${NRI_CONDA_PREFIX}/bin/python -m pip install -vU $(ls) --no-cache --no-cache-dir \
    && rm -rf /nri_quant

RUN echo "CLEAN UP AND SHRINKAGE DOCKER SIZE" \
    && conda clean --all -f -y  \
    && apt-get remove -y \
    gcc \
    python3-dev \
    && apt-get autoremove -y -qq \
    && apt-get clean -qq \
    # && pip cache purge \
    # ================================================================================
    && fix-permissions "${CONDA_DIR}" \
    && fix-permissions "${HOME}" \
    && echo \
    && echo \
    && echo \
    && echo "CONDA-NRI ENVIRONMENT SETUP DONE" \
    && echo "NRI-NOTEBOOK [DEBIAN ON TOP OF jupyter/minimal-notebook] IMAGE BUILT"

USER ${NB_UID}
WORKDIR ${HOME}
ENV TZ=Asia/Shanghai