#!/bin/bash

# tell bash to print out the statements as they are being executed so that we can see them running
set -x

# Install necessary dependencies - install docker - first run update - comments
sudo apt-get update -y 
# Update the apt package index and install packages to allow apt to use a repository over HTTPS:
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt-cache policy docker-ce
sudo apt-get install docker-ce
docker --version
sudo docker run hello-world
# login to docker and pull down image
sudo docker login --username $USERNAME --password $PASSWORD
docker pull johnny711dock/terra-project-api:latest

