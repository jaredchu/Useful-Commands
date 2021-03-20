#!/usr/bin/env bash

sudo apt-get update

sudo apt-get install -f docker.io
sudo systemctl enable --now docker
sudo usermod -aG docker $USER
newgrp docker

sudo apt-get install -f curl
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

docker --version
docker-compose version
# END
