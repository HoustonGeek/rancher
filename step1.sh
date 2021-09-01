#!/bin/bash
sudo apt-get update
echo "Install docker pre-reqs"
sudo apt-get install apt-transport-https ca-certificates curl gnupg lsb-release
echo "Add gpg key for docker repo"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo "add repo for docker"
echo  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
echo "Install docker"
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io
usermod -aG docker $USER
docker ps -a
