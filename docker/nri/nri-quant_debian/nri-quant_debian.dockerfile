# Dev Env on Ubuntu


FROM nri-rnd_debian:latest
LABEL MAINTAINER="gabrielwfeng@gmail.com"
LABEL ORG="NRI"
USER root
WORKDIR /root
ARG LINE1="--------------------------------------------------------------------------------"
ARG LINE2="================================================================================"
ENV TZ=Asia/Shanghai
ENV _CONDA_ENVNAME=nri
ENV _ORGPATH=/root/Repos/NRI
ENV _NRI_CONDA_PREFIX=/opt/conda/envs/${_CONDA_ENVNAME}
ENV _VNPATH=/root/Repos/NRI/infrastructure/vnpy_framework
COPY /infrastructure/akshare ${_ORGPATH}/infrastructure/akshare
COPY /infrastructure/nri_quant ${_ORGPATH}/infrastructure/nri_quant
COPY /infrastructure/vnpy_framework ${_ORGPATH}/infrastructure/vnpy_framework
COPY /apps/nri_scripts/onekey_vnpyenv.sh ${_ORGPATH}/apps/nri_scripts/onekey_vnpyenv.sh
COPY /apps/nri_scripts/onekey_vnpyenv_install_only.sh ${_ORGPATH}/apps/nri_scripts/onekey_vnpyenv_install_only.sh
# COPY /apps/nri_database ${_ORGPATH}/apps/nri_database
SHELL ["/bin/zsh",  "-c"]
RUN apt-get update -y && apt-get upgrade -y \
    && apt-get install -y -qq --no-install-recommends \
    locales \
    g++ \
    && source ~/.zshrc \
    && echo ${LINE2} \
    && echo "\n\n\nTALIB INSTALLATION" \
    && conda install -c conda-forge --name ${_CONDA_ENVNAME} ta-lib -y \
    && echo "TALIB INSTALLATION DONE" \
    && echo "\n\n\nVNPY SETUP" \
    && echo ${LINE2} \
    && locale-gen zh_CN.GB18030 \
    && echo ${LINE2} \
    && echo "\n\n\nVNPY SETUP" \
    && echo ${LINE1} \
    && ${_NRI_CONDA_PREFIX}/bin/python -m pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple \
    && ${_NRI_CONDA_PREFIX}/bin/python -m pip install --upgrade pip setuptools wheel \
    && ${_NRI_CONDA_PREFIX}/bin/python -m pip install -r ${_VNPATH}/vnpy/requirements.txt \
    && printf 'yyy' | bash ${_ORGPATH}/apps/nri_scripts/onekey_vnpyenv_install_only.sh \
    -py ${_NRI_CONDA_PREFIX}/bin/python \
    -vnpath ${_VNPATH} \
    -repos "vnpy vnpy_rest vnpy_websocket vnpy_influxdb vnpy_postgresql vnpy_datarecorder" \
    && echo "VNPY SETUP DONE" \
    && echo ${LINE2} \
    && echo "CLEAN UP" \
    && rm -rf ${_ORGPATH}/infrastructure/akshare ${_ORGPATH}/infrastructure/vnpy_framework ${_ORGPATH}/apps \
    && conda clean --all -f -y  \
    # && ${_NRI_CONDA_PREFIX}/bin/python -m pip cache purge --no-cache-dir \
    && apt-get remove g++ -y \
    && apt-get autoremove -y -qq \
    && apt-get clean -qq \
    && echo "\n\n\nNRI-RND [DEBIAN ON TOP OF continuumio/miniconda3] IMAGE BUILT"
CMD [ "/bin/bash" ]