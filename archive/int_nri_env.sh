#!/bin/bash
###
 # @Author: Gabriel Feng
 # @Date: 2021-11-29 19:03:53
 # @LastEditTime: 2021-11-29 20:37:00
 # @LastEditors: Gabriel Feng
 # @Description: 
 # @FilePath: \NRI\apps\nri_scripts\int_nri_env.sh
 # -------------------------------------------------------------------------------
### 

# conda create -n vnpy python=3.7 -y
# conda init vnpy
# source ~/.zshrc
# conda activate vnpy
# echo "using python $(which python)"
# conda install -c conda-forge ta-lib

python=$1
VNPY_FRAMEWORK_PATH=$2
shift 2

[[ -z $python ]] && python=python
[[ -z $VNPY_FRAMEWORK_PATH ]] && VNPY_FRAMEWORK_PATH=~/Repos/NRI/infrastructure/vnpy_framework

RepoNameArray=(vnpy vnpy_binance vnpy_okex vnpy_huobi vnpy_deribit vnpy_postgresql vnpy_influxdb vnpy_datarecorder vnpy_rest vnpy_websocket vnpy_ctastrategy vnpy_spreadtrading)

mkdir -p ~/Repos/NRI/apps/
mkdir -p $VNPY_FRAMEWORK_PATH

for repo_name in ${RepoNameArray[*]}; do
    filepath="$VNPY_FRAMEWORK_PATH/$repo_name"
    echo "--------------------------------------------------------------------------------"
    if [ -d $filepath ]; then
        echo "$filepath exists."

    else
        echo "git cloning $repo_name to $filepath"
        git clone --branch nri https://github.com/NovelResearchInvestment/$repo_name.git $filepath &&
        echo "$repo_name cloned."
    fi
done


RepoUpdateArray=(vnpy vnpy_binance vnpy_okex vnpy_huobi vnpy_deribit vnpy_postgresql vnpy_influxdb vnpy_datarecorder vnpy_rest vnpy_websocket vnpy_ctastrategy vnpy_spreadtrading)

for repo_name in ${RepoUpdateArray[*]}; do
    filepath="$VNPY_FRAMEWORK_PATH/$repo_name"
    echo "--------------------------------------------------------------------------------"
    echo "git pull $filepath..."
    git -C $filepath pull &&
    echo "pip install $filepath..."
    $python -m pip install $filepath/. -U --use-feature=in-tree-build
    echo "$repo_name pulled and installed/updated."
done
