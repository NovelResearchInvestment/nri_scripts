### nri-rnd
category: nri-rnd
dockerfile: `nri-rnd_debian`, `nri-rnd_centos`
usage: rnd environmet
python packages
- include: basic DS packages, akshare
- exclude: vnpy, jupyter-env

### nri-quant
category: nri-quant
dockerfile: `nri-quant_debian`, `nri-quant_centos`
usage: vnpy environment
- data recorder
- live/mock trading
python packages
- include: basic DS packages, akshare, vnpy
- exclude: jupyter-env
derived images
- moc_data
- moc_trade
- nmoc_data
- nmoc_trade

### basic os
category: os
dockerfile: `ubuntu-nri`, `centos-nri`
usage: base-os-image


### nri-notebook
category: jupyter
dockerfile: nri-notebook
usage: jupyter environment
- remote research
- tutorial
- simple projects
packages
- include: basic DS packages, akshare, nri-quant, jupyter-env
- exclude: vnpy