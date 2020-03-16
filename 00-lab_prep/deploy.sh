#!/usr/bin/env bash
echo "updating system..."
sudo apt-get update -qq > /dev/null 2>&1 
echo "installing docker..."
sudo apt-get -y install docker.io htop
sudo usermod -aG docker vagrant
echo "install docker-compose"
sudo curl -sL "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
echo "done."