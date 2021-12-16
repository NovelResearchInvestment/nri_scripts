# /bin/sh
###
 # @Author: Gabriel Feng
 # @Date: 2021-10-28 20:15:13
 # @LastEditTime: 2021-12-16 13:13:50
 # @LastEditors: Gabriel Feng
 # @Description:
 # @FilePath: \NRI\apps\nri_scripts\centos\centos_setup.sh
 # -------------------------------------------------------------------------------
###

# update
yum update -y
yum upgrade -y
yum install -y vim curl git wget tree zsh tmux
# yum -y install epel-release
# yum -y install htop
# yum group install -y "Development Tools"

# change time zone
export TZ=Asia/Shanghai
timedatectl set-timezone $(timedatectl list-timezones | grep -i Asia/Shanghai)

# # install awesome vim
# git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
# sh ~/.vim_runtime/install_awesome_vimrc.sh

# git clone --depth=1 https://github.com/tell-k/vim-autopep8.git ~/.vim_runtime/my_plugins/vim-rails
# python3 -m pip install pynvim
# echo "let g:python3_host_prog='/usr/bin/python3'" >> ~/.vimrc
# echo "Plugin 'Chiel92/vim-autoformat'" >> ~/.vimrc

#install tmux
printf 'yyy' | sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"  &&
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
mkdir ~/Downloads
mkdir ~/Repos

yum clean all && rm -rf /var/cache/yum