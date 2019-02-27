# local_dns_sync
The primary file for this project is add_and_sync.sh 

Copy this file to your pihole (preferably in /etc/pihole/) 

Make executable if necessary (chmod +x /etc/pihole/add_and_sync.sh) 

Run with sudo (sudo /etc/pihole/add_and_sync.sh) 

First time setup will add a line to your dnsmasq.d 

It will also create a lan.list in your /etc/pihole/ directory.
This is the file that will be modified to add your hosts.
This file can be manually edited also.

You can then add all of your local systems and reference them by DNS. (The script will walk you through this)

NOTE: This requires that your router points to your pihole for DNS.

The first time I set this up on my network I manually did it following this tutorial: 

https://discourse.pi-hole.net/t/howto-using-pi-hole-as-lan-dns-server/533 
