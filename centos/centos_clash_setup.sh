# proxy_setup: https://snapcraft.io/install/clash/centos

sudo yum install epel-release
sudo yum install snapd -y
sudo systemctl enable --now snapd.socket
sudo ln -s /var/lib/snapd/snap /snap
sudo snap install clash
