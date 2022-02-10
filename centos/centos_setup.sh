# /bin/bash

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

curl https://raw.githubusercontent.com/NovelResearchInvestment/nri_scripts/dev/configs/.tmux.conf > ~/.tmux.conf

# zsh
git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone --depth=1 https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

# make directories
mkdir -p ~/Downloads
mkdir -p ~/Repos

yum clean all && rm -rf /var/cache/yum