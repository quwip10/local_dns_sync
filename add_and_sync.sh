#!/bin/bash

printf "Name: "
read name

printf "Domain: "
read domain

printf "IP: "
read ip

printf "Comment: "
read comment

printf "\n#$comment \n" >> /etc/pihole/test_file
printf "$ip $name.$domain $name \n" >> /etc/pihole/test_file

pihole restartdns

/usr/bin/rsync ./lan.list atlasalex@pihole2:/etc/pihole/lan.list

ssh -t atlasalex@pihole2 'pihole restartdns'
