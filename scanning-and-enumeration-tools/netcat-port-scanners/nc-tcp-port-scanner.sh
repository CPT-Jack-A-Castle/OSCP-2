#!/usr/bin/bash

# Just a simple bash script that performs TCP port scanning using netcat. 
# Simply pass it the target address and port range you wish to scan.

if [ $# != 2 ]
then
	printf "Example Usage ./nc-tcp-port-scanner.sh 10.10.10.150 1-65535"
else
	/usr/bin/nc.traditional -nvv -z -w 2 $1 $2 2>&1 | grep open 
fi
