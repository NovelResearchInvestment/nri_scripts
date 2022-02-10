#!/bin/bash

containers="moc_data nmoc_data moc_trade nmoc_trade"

for ct in ${containers[*]}; do
    sudo docker commit --message="saved at $(date '+%Y-%m-%d %H:%M:%S')" $ct $ct:latest
    if [ $? -eq 0 ]; then
        echo "$(date '+%Y-%m-%d %H:%M:%S'): SUCESS: save $ct to $ct:latest"
    else
        echo "$(date '+%Y-%m-%d %H:%M:%S'): FAILED: $ct to $ct:latest"
    fi
done 