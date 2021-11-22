# 虚拟机管理


## 虚拟机架构

LOCAL: ubuntu

Docker Images
- centos-dev
- centos-dev/vnpy
- centos-dev/vnpy-stable:0.0.1
- centos-dev/vnpy-beta
- centos-dev/vnpy-dev
- centos-dev/influx
- centos-dev/influx-dev
- centos-dev/influx-beta
- centos-dev/influx-stable:0.0.1
- centos-dev/postgres
- centos-dev/postgres-dev
- centos-dev/postgres-beta
- centos-dev/postgres-stable:0.0.1
- ubuntu-dev
- ubuntu-dev/jupyter
- ubuntu-dev/jupyter-dev
- ubuntu-dev/jupyter-beta
- ubuntu-dev/jupyter-stable:0.0.1

## Note
命名规则：{os}-{os方向}/{应用}-{应用版本}
应用版本定义：
- dev：开发版，正在优化开发
- beta： 测试版，dev版本认为可以上线的
- stable: 稳定版，beta版稳定运行一段时间
应用版本对应容器使用方式：
- dev： 开发环境，把容器当作虚拟机，注意备份保存，阶段性储存为镜像。
- beta： 作为dev到stable的过渡，每次更新都应该基于stable版本进行更新，进而调试。可以不保存为镜像，可以把stable镜像当作beta的备份
- stable：稳定运行环境，每次正式运行前，应该保存为镜像。
Docker注意事项
- 注意控制镜像大小
- 注意容器内存使用，以免死机


## DockerReposFolderStruture
- docker
  - dev
  - apps
    - dev
    - beta
    - stable
  - template
- dockerbuild.sh
- docker-compose.yml(vnpy, influx, postgres)
- Dockerfile.vnpy
- Dockerfile.influx
- Dockerfile.postgres
- dockerbuild.sh
- docker-compose.yml(jupyter)
- Dockerfile.jupyter

## Steps
1. setup local environment
2. install system docker
3. setup image structure
3.1 pull base images: centos, ubuntu (necessary?)
3.2 setup DevOps derivated from base images
4. after a while once time comes, setup beta and stable
