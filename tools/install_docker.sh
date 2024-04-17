#! /bin/bash
# https://docs.docker.com/compose/install/linux/
DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}
mkdir -p $DOCKER_CONFIG/cli-plugins
curl -SL https://github.com/docker/compose/releases/download/v2.26.1/docker-compose-linux-x86_64 -o $DOCKER_CONFIG/cli-plugins/docker-compose
chmod +x $DOCKER_CONFIG/cli-plugins/docker-compose

sudo addgroup --system docker
sudo adduser $USER docker
newgrp docker
sudo setfacl -m "g:docker:rw" /var/run/docker.sock
sudo chmod -x /var/run/docker.sock
#sudo chmod 777 /var/run/docker.sock
