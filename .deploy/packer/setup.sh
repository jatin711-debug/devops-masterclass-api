#!/bin/bash

# tell bash to print out the statements as they are being executed so that we can see them running
set -x

# Install necessary dependencies - install docker - first run update - comments
sudo apt-get update -y 
# Update the apt package index and install packages to allow apt to use a repository over HTTPS:
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh ./get-docker.sh --dry-run
sudo sh ./get-docker.sh
sudo docker run hello-world
# login to docker and pull down image
sudo docker login --username $DOCKER_USERNAME --password $DOCKER_PASSWORD
sudo docker run johnny711dock/terra-project-api:latest

