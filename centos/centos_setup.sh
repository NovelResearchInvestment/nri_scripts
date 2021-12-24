# /bin/sh
###
 # @Author: Gabriel Feng
 # @Date: 2021-10-28 20:15:13
 # @LastEditTime: 2021-12-22 21:30:08
 # @LastEditors: Gabriel Feng
 # @Description:
 # @FilePath: \NRI\apps\nri_scripts\centos\centos_setup.sh
 # -------------------------------------------------------------------------------
###
set -e

# update
yum update -y
yum upgrade -y
yum install -y vim curl git wget tree zsh tmux

#install tmux
printf 'yyy' | bash -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"  &&
cd ~
git clone --depth=1 https://github.com/gpakosz/.tmux.git
ln -s -f ~/.tmux/.tmux.conf
cp ~/.tmux/.tmux.conf.local .tmux.conf.local
git clone --depth=1 https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

curl https://raw.githubusercontent.com/NovelResearchInvestment/nri_scripts/dev/centos/tmux.conf > ~/.tmux.conf

# zsh
git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone --depth=1 https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

# make directories
mkdir -p ~/Downloads
mkdir -p ~/Repos

yum clean all && rm -rf /var/cache/yum