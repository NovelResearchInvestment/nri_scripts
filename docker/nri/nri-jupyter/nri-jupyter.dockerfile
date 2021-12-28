ARG BASE_CONTAINER=$OWNER/scipy-notebook
# FROM jupyter/scipy-notebook
# FROM jupyter/base-notebook
FROM jupyter/minimal-notebook
LABEL maintainer="gabrielwfeng@gmail.com"
LABEL ORG="NRI"
USER root
ENV TZ=Asia/Shanghai
ENV _CONDA_PREFIX=/opt/conda
ENV _CONDA_ENVNAME=nri
ENV _ORGPATH=/root/Repos/NRI
ENV CONDA_DIR=/opt/conda
ENV _NRI_CONDA_PREFIX=${CONDA_DIR}/envs/${_CONDA_ENVNAME}
# ENV _VNPATH=/root/Repos/NRI/infrastructure/vnpy_framework
COPY /infrastructure/akshare ${_ORGPATH}/infrastructure/akshare
COPY /infrastructure/nri_quant ${_ORGPATH}/infrastructure/nri_quant
RUN apt-get update -qq \
    && apt-get upgrade -y \
    && apt-get install -y -qq --no-install-recommends \
    curl \
    apt-utils \
    # ================================================================================
    && echo "\n\n\nADV TERMINAL SETUP" \
    && bash -c "$(curl -fsSL https://raw.githubusercontent.com/NovelResearchInvestment/nri_scripts/dev/ubuntu/ubuntu_setup.sh)" \
    && echo "ADV TERMINAL SETUP DONE" \
    && mkdir -p ${_ORGPATH} \
    && conda update -n base -c defaults conda -y \
    && conda init zsh \
    && /bin/zsh -c "source ~/.zshrc" \
    # ================================================================================
    && echo "\n\n\nCONDA NRI ENVIRONMENT SETUP --- STEP 1: CREATE ENV" \
    && conda create -n ${_CONDA_ENVNAME} python=3.7 -y \
    && conda install -n ${_CONDA_ENVNAME} nb_conda_kernels ipykernel jupyter -y  \
    && ${_NRI_CONDA_PREFIX}/bin/python -m ipykernel install --user --name ${_CONDA_ENVNAME} \
    && mkdir -p ${_NRI_CONDA_PREFIX}/etc/conda/activate.d ${_NRI_CONDA_PREFIX}/etc/conda/deactivate.d \
    && touch ${_NRI_CONDA_PREFIX}/etc/conda/activate.d/env_vars.sh ${_NRI_CONDA_PREFIX}/etc/conda/deactivate.d/env_vars.sh \
    && echo "export PYTHONPATH=${CONDA_DIR}/bin:/bin:${_ORGPATH}/infrastructure/nri_quant:" >> ${_NRI_CONDA_PREFIX}/etc/conda/activate.d/env_vars.sh \
    && echo "export unset PYTHONPATH" >> ${_NRI_CONDA_PREFIX}/etc/conda/deactivate.d/env_vars.sh \
    # && echo "CONDA NRI ENVIRONMENT SETUP --- STEP 2: INSTALL PACKAGES" \
    # && ${_NRI_CONDA_PREFIX}/bin/python -m pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple \
    # && ${_NRI_CONDA_PREFIX}/bin/python -m pip install -r "${_ORGPATH}/infrastructure/nri_quant/requirements.txt" --no-cache --no-cache-dir >/dev/null \
    # && ${_NRI_CONDA_PREFIX}/bin/python -m pip install "${_ORGPATH}/infrastructure/akshare/." --no-cache >/dev/null \
    && echo "CONDA-NRI ENVIRONMENT SETUP DONE" \  
    # ================================================================================
    && rm -rf ${_ORGPATH}/infrastructure/akshare ${_ORGPATH}/apps \
    && conda clean --all -f -y  \
    # && ${_NRI_CONDA_PREFIX}/bin/python -m pip cache purge --no-cache-dir \
    && apt-get autoremove -y -qq \
    && apt-get clean -qq \
    && echo \
    && echo \
    && echo \
    && echo "NRI-RND [DEBIAN ON TOP OF continuumio/miniconda3] IMAGE BUILT" \
    && fix-permissions "${CONDA_DIR}" \
    && fix-permissions "/home/${NB_USER}" 