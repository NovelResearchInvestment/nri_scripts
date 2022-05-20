#!/bin/bash
#

# clean up
rm -rf ~/.vim_runtime ~/.oh-my-zsh 

# install vim
# git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
# sh ~/.vim_runtime/install_awesome_vimrc.sh

# zsh
printf 'yyy' | sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
wget -O .zshrc https://raw.githubusercontent.com/NovelResearchInvestment/nri_scripts/dev/configs/.zshrc
sed -in 's/plugins=(git)/plugins=(git zsh-syntax-highlighting zsh-autosuggestions z extract history)/g' ~/.zshrc

#install tmux
git clone https://github.com/gpakosz/.tmux.git ~/.tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
wget -O .tmux.conf https://raw.githubusercontent.com/NovelResearchInvestment/nri_scripts/dev/configs/.tmux.conf

conda init zsh
/bin/zsh -c "source ~/.zshrc"

