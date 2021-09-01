#!/bin/bash
ip4=$(/sbin/ip -o -4 addr list ens33 | awk '{print $4}' | cut -d/ -f1)
sudo useradd -G docker -m -p P@55w0rd rke
sudo apt install openssh-client -q -y
sudo - rke; ssh-keygen -t rsa -b 4096 -q -f /home/rke/.ssh/id_rsa -N ""; ssh-copy-id rke@$ip4
