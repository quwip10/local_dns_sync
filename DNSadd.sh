#!/bin/bash

printf "Name: "
read name

printf "IP: "
read ip

printf "Comment: "
read comment

printf "\n#$comment \n" >> /etc/pihole/lan.list
printf "$ip $name.heidenreich.hhn $name \n" >> /etc/pihole/lan.list

pihole restartdns

/usr/bin/rsync etc/pihole/lan.list atlasalex@pihole2:/etc/pihole/lan.list
/usr/bin/rsync etc/pihole/black.list atlasalex@pihole2:/etc/pihole/black.list
/usr/bin/rsync etc/pihole/blacklist.txt atlasalex@pihole2:/etc/pihole/blacklist.txt
/usr/bin/rsync etc/pihole/white.list atlasalex@pihole2:/etc/pihole/white.list
/usr/bin/rsync etc/pihole/whitelist.txt atlasalex@pihole2:/etc/pihole/whitelist.txt

ssh -t atlasalex@pihole2 'pihole restartdns'
