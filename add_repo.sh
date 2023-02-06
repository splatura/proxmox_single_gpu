#!/bin/sh

echo "# PVE pve-no-subscription repository provided by proxmox.com," >> /etc/apt/sources.list
echo "# NOT recommended for production use" >> /etc/apt/sources.list
echo "deb http://download.proxmox.com/debian/pve bullseye pve-no-subscription" >> /etc/apt/sources.list

apt update
apt dist-upgrade -y
