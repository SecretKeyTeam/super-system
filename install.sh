#!/bin/bash
apt-get update
apt-get install -y wget
apt-get install -y unzip
apt-get install -y nginx
apt-get install -y supervisor

# install oh-my-zsh
# sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

cwd_dir=`pwd`
echo $cwd_dir

# download trojan-go
mkdir -p ~/web/trojan-go
cd ~/web/trojan-go
wget https://github.com/p4gefau1t/trojan-go/releases/download/v0.10.6/trojan-go-linux-amd64.zip
unzip trojan-go-linux-amd64.zip
chmod +x trojan-go

# download cloudreve
mkdir -p ~/web/cloudreve
cd ~/web/cloudreve
wget https://github.com/cloudreve/Cloudreve/releases/download/3.4.1/cloudreve_3.4.1_linux_amd64.tar.gz
tar -zxvf cloudreve_3.4.1_linux_amd64.tar.gz
chmod +x cloudreve

# copy https crt
mkdir -p ~/web/https
cp $cwd_dir/nginx/1.crt ~/web/https
cp $cwd_dir/nginx/2.key ~/web/https
cp $cwd_dir/nginx/cloudreve /etc/nginx/sites-enabled/
service nginx restart

# copy trojan-go config
cp $cwd_dir/trojan-go/server.json ~/web/trojan-go

# copy cloudreve config
cp $cwd_dir/cloudreve/* ~/web/cloudreve

# copy supervisor config
cp $cwd_dir/supervisor/*.conf /etc/supervisor/conf.d

# start cloudreve
supervisorctl reload

