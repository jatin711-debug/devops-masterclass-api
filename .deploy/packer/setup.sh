#!/bin/bash

# tell bash to print out the statements as they are being executed so that we can see them running
set -x

# Install necessary dependencies - install docker - first run update - comments
sudo apt-get update -y 
# Update the apt package index and install packages to allow apt to use a repository over HTTPS:
sudo apt-get install \
    software-properties-common \
    apt-transport-https \
    dialog apt-utils \
    ca-certificates \
    curl \
    gnupg \
    snapd \
    lsb-release -y

sudo snap install docker

sudo docker run hello-world
# login to docker and pull down image
sudo docker login --username $USERNAME --password $PASSWORD
docker pull johnny711dock/terra-project-api:latest

