# /bin/bash
mkdir -p centos-dev
# cp ../../centos/centos_setup.sh centos-dev/centos_setup.sh &&
# cp ../../centos/.tmux.conf centos-dev/.tmux.conf &&
# cp ../../centos/.zshrc centos-dev/.zshrc &&

mkdir -p influxdb
# cp ../../centos/centos_setup.sh influxdb/centos_setup.sh &&
# cp ../../centos/.tmux.conf centos-dev/.tmux.conf &&
# cp ../../centos/.zshrc centos-dev/.zshrc &&

mkdir -p postgres
# cp ../../centos/centos_setup.sh postgres/centos_setup.sh &&
# cp ../../centos/.tmux.conf centos-dev/.tmux.conf &&
# cp ../../centos/.zshrc centos-dev/.zshrc &&

mkdir -p services
# cp ../../centos/centos_setup.sh services/centos_setup.sh &&
# cp ../../centos/.tmux.conf centos-dev/.tmux.conf &&
# cp ../../centos/.zshrc centos-dev/.zshrc &&

mkdir -p ubuntu-dev
# cp ../../ubuntu/ubuntu_setup.sh ubuntu-dev/ubuntu_setup.sh &&
# cp ../../centos/.tmux.conf .tmux.conf &&
# cp ../../centos/.zshrc .zshrc &&

mkdir -p jupyterhub
# cp ../../ubuntu/ubuntu_setup.sh jupyterhub/ubuntu_setup.sh &&
# cp ../../centos/.tmux.conf .tmux.conf &&
# cp ../../centos/.zshrc .zshrc &&


# docker build -t centos-dev . -f Dockerfile
docker-compose -f docker-compose.yml up
# docker-compose run centos-dev
# docker-compose run influxdb
# docker-compose run postgres
# docker-compose run services
# docker-compose run ubuntu-dev
# docker-compose run jupyterhub


# docker run -it -d \
#     -p 127.0.0.1:80:8050/tcp \
#     -e TZ=Asia/Shanghai \
#     -w /root/ \
#     --name test centos/vnpy:latest /bin/bash