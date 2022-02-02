#!/bin/bash
apt-get update
apt-get install -y wget
apt-get install -y unzip
apt-get install -y nginx
apt-get install -y supervisor

cwd_dir=`pwd`
echo $cwd_dir

# download trojan-go
mkdir -p ~/web/trojan-go
cd ~/web/trojan-go
wget https://github.com/p4gefau1t/trojan-go/releases/download/v0.10.6/trojan-go-linux-amd64.zip
unzip trojan-go-linux-amd64.zip

# download 
mkdir -p ~/web/cloudreve
cd ~/web/cloudreve
wget https://github.com/cloudreve/Cloudreve/releases/download/3.4.2/cloudreve_3.4.2_linux_amd64.tar.gz
tar -zxvf cloudreve_3.4.2_linux_amd64.tar.gz

