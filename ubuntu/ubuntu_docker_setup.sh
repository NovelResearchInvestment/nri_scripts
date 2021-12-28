# /bin/sh
###
 # @Author: Gabriel Feng
 # @Date: 2021-10-28 20:15:13
 # @LastEditTime: 2021-11-29 13:34:09
 # @LastEditors: Gabriel Feng
 # @Description:
 # @FilePath: \NRI\apps\nri_scripts\ubuntu\ubuntu_docker_setup.sh
 # -------------------------------------------------------------------------------
###

# update
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null


sudo apt-get install -y docker.io


curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash


# make alias
echo "alias dk='docker'" >> ~/.zshrc
echo "alias dka='docker attach'" >> ~/.zshrc
echo "alias dkc='docker container'" >> ~/.zshrc
echo "alias dki='docker image'" >> ~/.zshrc
echo "alias dkv='docker volume'" >> ~/.zshrc
echo "alias lzd='lazydocker'" >> ~/.zshrc

source ~/.zshrc