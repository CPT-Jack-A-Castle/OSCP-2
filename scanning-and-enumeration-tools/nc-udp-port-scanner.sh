#!/usr/bin/bash

# A simple script to perform UDP port scanning with netcat
# Simply pass it your target address and port range you wish to scan 

if [ $# != 2 ]
then
	echo "Example usage: ./nc-udp-port-scanner.sh"
else
	/usr/bin/nc.traditional -nv -u -z -w 2 $1 $2 
fi
