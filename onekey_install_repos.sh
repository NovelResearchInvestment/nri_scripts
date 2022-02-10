#!/bin/bash
###
 # @Author: Gabriel Feng
 # @Date: 2021-11-30 19:18:25
 # @LastEditTime: 2021-12-19 18:10:33
 # @LastEditors: Gabriel Feng
 # @Description: 
 # @FilePath: \NRI\apps\nri_scripts\onekey_install_repos.sh
 # -------------------------------------------------------------------------------
### 

# Example: bash onekey_vnpyenv.sh -py $(which python) -vnpath ~/Repos/NRI/infrastructure/vnpy_framework -repos "vnpy_binance vnpy_okex" 

python=python
VNPY_FRAMEWORK_PATH=~/Repos/NRI/infrastructure/vnpy_framework
ReposArray="vnpy vnpy_ctp vnpy_binance vnpy_okex vnpy_huobi vnpy_deribit vnpy_postgresql vnpy_influxdb vnpy_datarecorder vnpy_rest vnpy_websocket vnpy_ctastrategy vnpy_spreadtrading"

while test $# -gt 0; do
        case "$1" in
            -py)
                shift
                python=$1
                shift
                ;;
            -vnpath)
                shift
                VNPY_FRAMEWORK_PATH=$1
                shift
                ;;
            -repos)
                shift
                ReposArray=$1
                shift
                ;;
            *)
                echo "$1 is not a recognized flag!"
                return 1;
                ;;
        esac
done  

echo "Python executable: $python"
echo "VNPY_FRAMEWORK_PATH: $VNPY_FRAMEWORK_PATH"
echo "ReposArray: $ReposArray"

mkdir -p $VNPY_FRAMEWORK_PATH

for repo_name in ${ReposArray[*]}; do
    filepath="$VNPY_FRAMEWORK_PATH/$repo_name"
    echo "--------------------------------------------------------------------------------"
    if [ -d $filepath ]; then
        echo "$filepath exists."
    else
        # echo "git cloning $repo_name to $filepath"
        # git clone --branch nri https://github.com/NovelResearchInvestment/$repo_name.git $filepath &&
        # echo "$repo_name cloned."

        # echo "git remote add in [https://github.com/vnpy/$repo_name.git] to $filepath..."
        # git -C $filepath remote add vnpy "https://github.com/vnpy/$repo_name.git"  

        # echo "git pull $filepath..."
        # git -C $filepath pull &&
        echo "pip install $filepath..."
        $python -m pip install $filepath/. -U --use-feature=in-tree-build
        echo "$repo_name pulled and installed/updated."      


    fi
done
