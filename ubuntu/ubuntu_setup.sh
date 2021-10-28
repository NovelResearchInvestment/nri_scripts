# update
apt-get update -y && apt-get upgrade -y
apt update -y & apt upgrade -y
apt-get install -y vim git curl wget htop tree zsh tmux proxychains tor autossh tor pip jq timeshift
apt-get install -y build-essential gcc python3-dev openssl zip automake make libevent-dev
rm -rf /var/lib/apt/lists
# change time zone
timedatectl set-timezone $(timedatectl list-timezones | grep -i Asia/Shanghai)

# install vim
mkdir ~/.vim_runtime
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

# git clone https://github.com/tell-k/vim-autopep8.git ~/.vim_runtime/my_plugins/vim-rails
# python3 -m pip install pynvim
# echo "let g:python3_host_prog='/usr/bin/python3'" >> ~/.vimrc
# echo "Plugin 'Chiel92/vim-autoformat'" >> ~/.vimrc

#install tmux
y | sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
cd ~
git clone https://github.com/gpakosz/.tmux.git
ln -s -f ~/.tmux/.tmux.conf
cp ~/.tmux/.tmux.conf.local .tmux.conf.local
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
echo "
# List of plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'tmux-plugins/tmux-resurrect'
set -g @plugin 'tmux-plugins/tmux-continuum'

# Other examples:
# set -g @plugin 'github_username/plugin_name'
# set -g @plugin 'github_username/plugin_name#branch'
# set -g @plugin 'git@github.com:user/plugin'
# set -g @plugin 'git@bitbucket.com:user/plugin'

# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
run '~/.tmux/plugins/tpm/tpm'" >> ~/.tmux.conf

echo "set-option -g default-shell /bin/zsh" >> ~/.tmux.conf


# zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
sed -in 's/plugins=(git)/plugins=(git zsh-syntax-highlighting zsh-autosuggestions z extract history)/g' ~/.zshrc

# instal thefuck
# apt-get -y install python3-dev python3-pip python3-setuptools
y | apt-get install thefuck
eval $(thefuck --alias fuck) >> ~/.zshrc

# # install tor
# apt-get -y install libevent-dev libssl-dev zlib1g zlib1g-dev asciidoc
# apt-get -y install docbook-xsl docbook-xml xmlto
# cd ~ && git clone https://github.com/torproject/tor && cd tor
# sh autogen.sh && ./configure && make && make install


# make alias
echo "alias tn='tmux new -s'" >> ~/.zshrc
echo "alias tt='tmux a -t'" >> ~/.zshrc
echo "alias tk='tmux kill-session -t'" >> ~/.zshrc
echo "alias tl='tmux ls'" >> ~/.zshrc


# make directories
mkdir ~/downloads
mkdir ~/repos

source ~/.zshrc

# backup full server and restore
# https://linuxconfig.org/ubuntu-20-04-system-backup-and-restore
# sudo timeshift --create
# sudo timeshift --list
# sudo timeshift --restore --snapshot "2020-02-19_18-32-36"
# sudo timeshift --delete  --snapshot '2014-10-12_16-29-08'


#
# echo 'Port=60223' >> /etc/ssh/sshd_config
# service sshd restart

# 233boy
# bash <(curl -s -L https://git.io/v2ray.sh)