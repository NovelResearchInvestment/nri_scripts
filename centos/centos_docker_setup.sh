# @Author: Gabrielvon
# @Date:   2021-07-29 08:43:00
# @Last Modified by:   Gabrielvon
# @Last Modified time: 2021-08-30 12:37:56


# # Attpemt 1
# # https://docs.docker.com/engine/install/centos/
# #  sudo yum install -y yum-utils
# #  sudo yum-config-manager \
# #     --add-repo \
# #     https://download.docker.com/linux/centos/docker-ce.repo


# # sudo yum-config-manager --enable docker-ce-nightly
# # sudo yum install docker-ce docker-ce-cli containerd.io
# # sudo systemctl start docker
#  curl -fsSL https://get.docker.com -o get-docker.sh
#  sh ./get-docker.sh
#  rm get-docker.sh

# yum install -y -q yum-utils
# yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
# sudo yum-config-manager --enable docker-ce-nightly
# sudo yum install docker-ce docker-ce-cli containerd.io
# yum makecache
# yum install -y -q docker-ce
# yum install -y -q docker-ce-rootless-extras


# Attempt 2
# https://phoenixnap.com/kb/how-to-install-docker-on-centos-8
# sudo curl -L https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose sudo chmod +x /usr/local/bin/docker-compose

# sudo dnf repolist -v
# dnf list docker-ce --showduplicates | sort -r
sudo dnf install docker-ce containerd --allowerasing -y
systemctl enable --now docker
sudo usermod -aG docker $USER
source ~/.zshrc


# others
sudo dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo
curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash
echo ""



# make alias
echo "alias dk='docker'" >> ~/.zshrc
echo "alias dka='docker attach'" >> ~/.zshrc
echo "alias dkc='docker container'" >> ~/.zshrc
echo "alias dki='docker image'" >> ~/.zshrc
echo "alias dkv='docker volume'" >> ~/.zshrc

# # create and start
# docker create --name=test centos
# docker start -i test
# docker run -it -d -e TZ=Asia/Shanghai -w /root/ --name test centos/vnpy:latest /bin/bash
#
# docker run -it -d -e TZ=Asia/Shanghai -w /root/ --name test centos/vnpy:latest /bin/bash
# docker run -it -d -e TZ=Asia/Shanghai -w /root/ --name test centos/vnpy:latest /bin/bash
docker run -p 127.0.0.1:80:8050/tcp -it -d -e TZ=Asia/Shanghai -w /root/ --name test centos/vnpy:latest /bin/bash


