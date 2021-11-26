VNPY_FRAMEWORK_PATH=~/Repos/NRI/infrastructure/vnpy_framework
RepoNameArray=(vnpy vnpy_binance vnpy_okex vnpy_huobi vnpy_deribit vnpy_postgresql vnpy_influxdb vnpy_datarecorder vnpy_rest vnpy_websocket vnpy_ctastrategy vnpy_spreadtrading)

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
