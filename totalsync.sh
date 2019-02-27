#!/bin/bash
#This script syncs the DNS lists, white lists, and black lists between both pihole devices.

/usr/bin/rsync --progress --include \'black*\' --include \'white*\' --include \'lan.list\' --exclude \'*\' --dry-run /etc/pihole/ atlasalex@pihole2:/etc/pihole/

#ssh -t atlasalex@pihole2 'pihole restartdns'
