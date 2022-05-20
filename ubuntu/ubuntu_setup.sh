#!/bin/bash

set -e

# update
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install -y vim curl git wget tree zsh tmux

# oh-my-zsh
printf 'yyy' | bash -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
curl https://raw.githubusercontent.com/NovelResearchInvestment/nri_scripts/dev/configs/.zshrc > ~/.zshrc

#install tmux
cd ~    
git clone --depth=1 https://github.com/gpakosz/.tmux.git
ln -s -f ~/.tmux/.tmux.conf
cp ~/.tmux/.tmux.conf.local .tmux.conf.local
git clone --depth=1 https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# wget -cO https://raw.githubusercontent.com/NovelResearchInvestment/nri_scripts/main/centos/tmux.conf > ~/.tmux.conf
curl https://raw.githubusercontent.com/NovelResearchInvestment/nri_scripts/dev/configs/tmux.conf > ~/.tmux.conf

# zsh
git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone --depth=1 https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

# make directories

# clean up
sudo apt-get autoremove -y -qq
sudo apt-get clean -qq
rm -rf /var/lib/apt/lists