#!/bin/bash
#This script syncs the DNS lists, white lists, and black lists between both pihole devices.

/usr/bin/rsync /etc/pihole/lan.list atlasalex@pihole2:/etc/pihole/lan.list
/usr/bin/rsync /etc/pihole/black.list atlasalex@pihole2:/etc/pihole/black.list
/usr/bin/rsync /etc/pihole/blacklist.txt atlasalex@pihole2:/etc/pihole/blacklist.txt
#/usr/bin/rsync /etc/pihole/white.list atlasalex@pihole2:/etc/pihole/white.list
/usr/bin/rsync /etc/pihole/whitelist.txt atlasalex@pihole2:/etc/pihole/whitelist.txt

ssh -t atlasalex@pihole2 'pihole restartdns'
