#!/bin/bash
apt-get update -y
apt-get install -y docker.io
sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

docker-compose version

systemctl enable --now docker

apt-get install -y git

git clone https://github.com/iam-veeramalla/three-tier-architecture-demo.git

git clone https://github.com/docker/awesome-compose.git

cd /three-tier-architecture-demo
sudo /usr/local/bin/docker-compose up -d


cd /awesome-compose/nginx-nodejs-redis
sudo /usr/local/bin/docker-compose up -d


