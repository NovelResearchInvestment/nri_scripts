# /bin/sh
###
 # @Author: Gabriel Feng
 # @Date: 2021-10-28 20:15:13
 # @LastEditTime: 2021-11-22 16:45:18
 # @LastEditors: Gabriel Feng
 # @Description:
 # @FilePath: /nri_scripts/centos/centos_setup.sh
 # -------------------------------------------------------------------------------
###

# update
yum update -y
yum upgrade -y
yum install -y vim git curl wget tree zsh tmux jq
# yum -y install epel-release
# yum -y install htop
# yum group install -y "Development Tools"

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
printf 'yyy' | sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"  &&
cd ~
git clone https://github.com/gpakosz/.tmux.git
ln -s -f ~/.tmux/.tmux.conf
cp ~/.tmux/.tmux.conf.local .tmux.conf.local
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

curl https://raw.githubusercontent.com/NovelResearchInvestment/nri_scripts/main/centos/tmux.conf > ~/.tmux.conf
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

# make alias
echo "
alias tn='tmux new -s'
alias tt='tmux a -t'
alias tk='tmux kill-session -t'
alias tl='tmux ls'
" >> ~/.zshrc


# make directories
mkdir ~/Downloads
mkdir ~/Repos