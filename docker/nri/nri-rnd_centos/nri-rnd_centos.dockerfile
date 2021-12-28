# Dev Env on Ubuntu


FROM centos-nri:latest
LABEL MAINTAINER="gabrielwfeng@gmail.com"
LABEL ORG="NRI"
USER root
WORKDIR /root
ENV TZ=Asia/Shanghai
ENV _CONDA_PREFIX=/opt/conda
# ENV _CONDA_EXE=${_CONDA_PREFIX}/bin/conda
ENV _CONDA_ENVNAME=nri
ENV _ORGPATH=/root/Repos/NRI
ENV _NRI_CONDA_PREFIX=${_CONDA_PREFIX}/envs/${_CONDA_ENVNAME}
# ENV _VNPATH=/root/Repos/NRI/infrastructure/vnpy_framework
COPY /infrastructure/akshare ${_ORGPATH}/infrastructure/akshare
COPY /infrastructure/nri_quant ${_ORGPATH}/infrastructure/nri_quant
# COPY /apps/nri_database ${_ORGPATH}/apps/nri_database

RUN yum update -y && yum upgrade -y \
    && mkdir -p ${_ORGPATH} \
    # ================================================================================
    && echo "\n\n\nCONDA INSTALLATION" \
    && bash -c "$(curl -fsSL https://raw.githubusercontent.com/NovelResearchInvestment/nri_scripts/dev/centos/centos_conda_setup.sh)" \
    && export PATH=${_CONDA_PREFIX}/bin:$PATH \
    && conda update -n base -c defaults conda -y\
    && echo "CONDA INSTALLATION DONE" \
    # ================================================================================
    # ================================================================================
    && echo "\n\n\nCONDA NRI ENVIRONMENT SETUP --- STEP 1: CREATE ENV" \
    # --------------------------------------------------------------------------------
    && conda create -n ${_CONDA_ENVNAME} python=3.7 -y \
    && mkdir -p ${_NRI_CONDA_PREFIX}/etc/conda/activate.d ${_NRI_CONDA_PREFIX}/etc/conda/deactivate.d \
    && touch ${_NRI_CONDA_PREFIX}/etc/conda/activate.d/env_vars.sh ${_NRI_CONDA_PREFIX}/etc/conda/deactivate.d/env_vars.sh \
    && echo "export PYTHONPATH=/opt/conda/bin:/bin:${_ORGPATH}/infrastructure/nri_quant:" >> ${_NRI_CONDA_PREFIX}/etc/conda/activate.d/env_vars.sh \
    && echo "export unset PYTHONPATH" >> ${_NRI_CONDA_PREFIX}/etc/conda/deactivate.d/env_vars.sh \
    && echo "CONDA NRI ENVIRONMENT SETUP --- STEP 2: INSTALL PACKAGES" \
    # --------------------------------------------------------------------------------
    && ${_NRI_CONDA_PREFIX}/bin/python -m pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple \
    && ${_NRI_CONDA_PREFIX}/bin/python -m pip install -r "${_ORGPATH}/infrastructure/nri_quant/requirements.txt" --no-cache --no-cache-dir >/dev/null \
    && ${_NRI_CONDA_PREFIX}/bin/python -m pip install "${_ORGPATH}/infrastructure/akshare/." --no-cache >/dev/null \
    && echo "CONDA-NRI ENVIRONMENT SETUP DONE" \
    # ================================================================================
    && rm -rf ${_ORGPATH}/infrastructure/akshare ${_ORGPATH}/apps \
    && conda clean --all -f -y  \
    && ${_NRI_CONDA_PREFIX}/bin/python -m pip cache purge \
    && yum clean all \
    && echo "\n\n\nNRI-RND [CENTOS] IMAGE BUILT"
CMD [ "/bin/bash" ]