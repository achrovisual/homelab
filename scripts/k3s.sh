#!/bin/bash

# Version of Kube-VIP to deploy
KVVERSION="v0.8.1"

# K3S Version
k3sVersion="v1.28.10+k3s1"

# Set the IP addresses of the master and work nodes
master1=172.16.4.62
master2=172.16.4.63
master3=172.16.4.64
worker1=172.16.4.65
worker2=172.16.4.66

# User of remote machines
user=root

# Interface used on remotes
interface=eth0

# Set the virtual IP address (VIP)
vip=172.16.4.254

# Array of master nodes
masters=($master2 $master3)

# Array of worker nodes
workers=($worker1 $worker2)

# Array of all
all=($master1 $master2 $master3 $worker1 $worker2)

# Array of all minus master
allnomaster1=($master2 $master3 $worker1 $worker2)

#Loadbalancer IP range
lbrange=172.16.4.81-172.16.4.100

#ssh certificate name variable
certName=id_ed25519

# Generate cert
sudo ssh-keygen -q -t ed25519 -N '' -f ~/.ssh/$certName

# For testing purposes - in case time is wrong due to VM snapshots
sudo timedatectl set-ntp off
sudo timedatectl set-ntp on

# Generate cert
sudo ssh-keygen -q -t ed25519 -N '' -f ~/.ssh/$certName

# Change cert permissions
chmod 600 /$user/.ssh/$certName 
chmod 644 /$user/.ssh/$certName.pub