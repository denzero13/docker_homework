#!/bin/sh

hostname -i > server_ip
nc -k -l 8080
