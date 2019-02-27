#!/bin/bash

#Global Variable Declarations
continue="y"
name="system"
domain="domain.com"
ip="555.555.555.555"
comment="none"

#check for first run pihole config in dnsmasq.d
if grep -q addn-hosts=/etc/pihole/lan.list /etc/dnsmasq.d/02-lan.conf;
then
	printf "Not first run \n"
else
	printf "First RUN! \n"
	printf "Adding to DNSMASQ!\n"
	echo "addn-hosts=/etc/pihole/lan.list" | sudo tee /etc/dnsmasq.d/02-lan.conf

	sleep 1
fi

#Check if secondary DNS file exists
if [ -f ./secondaryDNS ];
then
	read -r secondary_IP<./secondaryDNS
	
	#Check if size is greater than zero then load the IP
	if [ -s ./secondaryDNS ];
	then
		printf "\n***Loaded secondary DNS IP from file!***\n"
		printf "IP: $secondary_IP \n"
		sleep 3
	fi
else
	printf "Do you have a secondary, local, DNS server (another pihole)? (y/n) "
	read second_server

	if [ $second_server == "y" ];
	then
		printf "Enter secondary server IP address: "
		read second_server_IP
		printf $second_server_IP >> ./secondaryDNS
	else
		touch ./secondaryDNS
	fi
fi

printf "Domain (example: mydomain.com): "
read domain

until [ $continue == "n" ];
do
  printf "System Name: "
  read name

  printf "IP: "
  read ip

  printf "Comment: "
  read comment

  printf "\n#$comment \n" >> /etc/pihole/lan.list
  printf "$ip $name.$domain $name \n" >> /etc/pihole/lan.list
  
  printf "Add another? (y/n): "
  read continue
done

#Below commands used to sync lan.list to secondary pihole
#and restart both dns services

#****NOTE $username is not defined yet********

#Restart pihole DNS Service for changes to take affect.
pihole restartdns

#/usr/bin/rsync /etc/pihole/lan.list "$username"@"$secondary_IP":/etc/pihole/lan.list

#ssh -t "$username"@"$secondary_IP" 'pihole restartdns'



