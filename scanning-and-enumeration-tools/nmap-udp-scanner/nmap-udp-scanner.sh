#!/usr/bin/bash

if [ $# -ne 1 ]
then
	echo "Please enter a valid IP address to scan"
	echo "Example usage: ./nmap-udp-scanner.sh <IP>"
else
	ports=$(nmap -sU -vv -Pn --min-rate=1000 -p- -T4 $1 | grep ^[0-9] | cut -d '/' -f1 | tr '\n' ',' | sed s/,$//)
	nmap -vv -Pn $ports -sC -sV $1 -oA $1-udp-port-scan
fi

