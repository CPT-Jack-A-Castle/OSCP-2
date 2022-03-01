#!/bin/bash

# Specify the type of web server you would like to spin up
# Specify the port 
# Remember to change this eth0 to tun0 to get the IP of the tun0 interface, however many of the servers will listen on 0.0.0.0 
# NOTE: ALWAYS TAKE SNAPSHOTS OF YOUR VIRTUAL MACHINE BEFORE RUNNING ANY SCRIPTS/EXPLOITS !!
# Add this to your .profile file and source it, to run the script from anywhere in your Kali machine

ip=$(ifconfig eth0 | grep inet | awk '{print $2}' | grep -Eo '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}')

echo "Supported server types: "
echo "[1] busybox"
echo "[2] php"
echo "[3] python2"
echo "[4] python3"
echo "[5] ruby"
echo " "
echo "Eg. 1"
echo " "
printf "Specify a server type: "
read server

printf "Specify port: "
read port

if [[ $server == '1' ]]
then
	function busybox_web_server()
	{
		for name in $(ls);do echo 'http://'$ip':'$port'/'$name;done	
		/usr/bin/busybox httpd -f -p $port;
	}
busybox_web_server

elif [[ $server == '2' ]]
then
	function php_web_server()
	{	
		for name in $(ls);do echo 'http://'$ip':'$port'/'$name;done
		/usr/bin/php -S $ip:$port;
	}
php_web_server

elif [[ $server == '3' ]]
then
	function python2_web_server()
	{
		for name in $(ls);do echo 'http://'$ip':'$port'/'$name;done
		/usr/bin/python2 -m SimpleHTTPServer $port;
	}
python2_web_server

elif [[ $server == '4' ]]
then
	function python3_web_server()
	{	
		for name in $(ls);do echo 'http://'$ip':'$port'/'$name;done
		python3 -m http.server $port 
	}
python3_web_server

elif [[ $server == 'ruby' ]]
then
	function ruby_web_server()
	{
		for name in $(ls);do echo 'http://'$ip':'$port'/'$name;done
		ruby -run -e httpd . -p $port
	}
ruby_web_server
fi


