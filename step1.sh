#!/bin/bash
sudo apt-get update
echo "Install docker pre-reqs"
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common
echo "Add gpg key for docker repo"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apot-key add -

echo "add repo for docker"
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
echo "Install docker"
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io

usermod -aG docker $USER
docker ps -a
