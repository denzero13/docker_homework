#!/bin/sh

server_ip="server_ip"

while true; do
    if [ -f "$server_ip" ] && [ -s "$server_ip" ];then
        ip=$(cat "$server_ip")
        echo "Server founded"	
        echo "Hello from client" | nc -q 1 $ip 8080
    else
	echo 'Server not found'
    fi
    sleep 1  
done
