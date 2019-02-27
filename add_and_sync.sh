#!/bin/bash

#Global Variable Declarations
continue="y"
name="system"
domain="domain.com"
ip="555.555.555.555"
comment="none"

printf "Domain: "
read domain

until [ $continue == "n" ];
do
  printf "System Name: "
  read name

  printf "IP: "
  read ip

  printf "Comment: "
  read comment

  printf "\n#$comment \n" >> /etc/pihole/test_file
  printf "$ip $name.$domain $name \n" >> /etc/pihole/test_file
  
  printf "Add another? (y/n): "
  read continue
done

pihole restartdns

/usr/bin/rsync /etc/pihole/lan.list atlasalex@pihole2:/etc/pihole/lan.list

ssh -t atlasalex@pihole2 'pihole restartdns'
