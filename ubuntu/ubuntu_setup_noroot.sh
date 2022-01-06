# /bin/sh
###
 # @Author: Gabriel Feng
 # @Date: 2021-10-28 20:15:13
 # @LastEditTime: 2021-11-22 15:53:29
 # @LastEditors: Gabriel Feng
 # @Description:
 # @FilePath: /nri_scripts/ubuntu/ubuntu_setup.sh
 # -------------------------------------------------------------------------------
###
#
# update

# install vim
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

# zsh
printf 'yyy' | sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
sed -in 's/plugins=(git)/plugins=(git zsh-syntax-highlighting zsh-autosuggestions z extract history)/g' ~/.zshrc

#install tmux
git clone https://github.com/gpakosz/.tmux.git ~/.tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
wget https://raw.githubusercontent.com/NovelResearchInvestment/nri_scripts/dev/configs/.tmux.conf


