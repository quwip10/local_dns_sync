#!/bin/bash

printf "Name: "
read name

printf "IP: "
read ip

printf "Comment: "
read comment

printf "\n#$comment \n" >> /etc/pihole/testerbutt
printf "$ip $name.heidenreich.hhn $name \n" >> /etc/pihole/testerbutt

pihole restartdns

/usr/bin/rsync ./lan.list atlasalex@pihole2:/etc/pihole/lan.list

ssh -t atlasalex@pihole2 'pihole restartdns'
