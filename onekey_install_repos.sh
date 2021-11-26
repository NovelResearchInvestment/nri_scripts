
python=$1
VNPY_FRAMEWORK_PATH=$2
shift 2

[[ -z $python ]] && python=python
[[ -z $VNPY_FRAMEWORK_PATH ]] && VNPY_FRAMEWORK_PATH=~/Repos/NRI/infrastructure/vnpy_framework

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
