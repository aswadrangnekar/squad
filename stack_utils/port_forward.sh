#!/bin/sh
#
# Usage:
# This script is tested on ubuntu

source_port=8080
dest_ip="192.168.0.95"
dest_port=80

# Enable port forwarding
sudo sysctl net.ipv4.ip_forward=1

# Nat to dest port
iptables -t nat -A PREROUTING -i eth0 -p tcp --dport $source_port -j DNAT --to $dest_ip:$dest_port
iptables -t nat -A PREROUTING -p tcp --dport $source_port -j DNAT --to $dest_ip:$dest_port
iptables -t nat -A POSTROUTING -p tcp -d $dest_ip --dport $dest_port -j MASQUERADE
