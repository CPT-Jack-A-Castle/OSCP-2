#!/usr/bin/bash

if [ $# -ne 1 ]
then 
	echo "ENTER A VALID IP ADDRESS TO SCAN!"
else
	ports=$(rustscan -a $1 -r 0-65535 -g -n | sed 's/\[//g' | sed 's/\]//g' | cut -d " " -f 3) 
	nmap $1 -sV -sC -Pn -p $ports -oA $1-rustscan-and-nmap-all-tcp-ports
fi

