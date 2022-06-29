#!/usr/bin/bash


echo "=========================="
echo "i686 or i386 = 32bit"
echo "x86_64 = 64bit"
echo "=========================="
echo " "

uname=$(uname -m)

echo "running command uname -m...architecture is: $uname"

arch=$(arch)

echo "running the arch command...architecture is: $arch"

lscpu=$(lscpu | grep Architecture | awk '{print $NF}')

echo "running the lscpu command...architecture is: $lscpu"

getconf=$(getconf LONG_BIT)

echo "running getconf_LONGBIT command...architecture is: $getconf bit"
