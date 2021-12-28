# Dev Env on Ubuntu


FROM nri-rnd_centos:latest
LABEL MAINTAINER="gabrielwfeng@gmail.com"
LABEL ORG="NRI"
USER root
WORKDIR /root
ARG LINE1="--------------------------------------------------------------------------------"
ARG LINE2="================================================================================"
ENV TZ=Asia/Shanghai
ENV _CONDA_PREFIX=/opt/conda
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
RUN yum update -y && yum upgrade -y \
    && source ~/.zshrc \
    && echo ${LINE2} \
    && echo "\n\n\nLANGPACK-zh SETUP" \
    && echo ${LINE1} \
    && yum -y reinstall glibc-common \
    && yum -y install glibc-locale-source glibc-langpack-zh \
    && localedef -c -i zh_CN -f GB18030 zh_CN.GB18030 \
    && echo 'LANG="zh_CN.GB18030"' > /etc/locale.conf \
    && /bin/zsh -c "source /etc/locale.conf" \
    && echo "LANGPACK-zh SETUP DONE" \
    && echo ${LINE2} \
    && echo ${LINE2} \
    && echo "\n\n\nTALIB INSTALLATION" \
    && echo ${LINE1} \
    && conda install -c conda-forge --name ${_CONDA_ENVNAME} ta-lib -y \
    && echo "TALIB INSTALLATION DONE" \
    && echo ${LINE2} \
    && echo ${LINE2} \
    && echo "\n\n\nVNPY SETUP" \
    && echo ${LINE1} \
    && yum install gcc-c++ -y \
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
    && ${_NRI_CONDA_PREFIX}/bin/python -m pip cache purge \
    && yum remove gcc-c++ -y \
    && yum clean all \
    && echo "\n\n\nNRI-QUANT [CENTOS ON TOP OF gabrielvon/centos-nri] IMAGE BUILT"
CMD [ "/bin/bash" ]