# /bin/sh

# update
apt-get update -y && apt-get upgrade -y
apt-get install -y vim git curl wget tree zsh tmux jq

#install tmux
printf 'yyy' | sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
cd ~
git clone https://github.com/gpakosz/.tmux.git
ln -s -f ~/.tmux/.tmux.conf
cp ~/.tmux/.tmux.conf.local .tmux.conf.local
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# wget -cO https://raw.githubusercontent.com/NovelResearchInvestment/nri_scripts/main/centos/tmux.conf > ~/.tmux.conf
curl https://raw.githubusercontent.com/NovelResearchInvestment/nri_scripts/main/centos/tmux.conf > ~/.tmux.conf

# zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

# make directories
mkdir -p ~/Downloads
mkdir -p ~/Repos

# clean up
apt-get autoremove -y -qq
apt-get clean -qq
rm -rf /var/lib/apt/lists