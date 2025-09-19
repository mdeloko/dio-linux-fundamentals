#!/bin/bash

sudo apt update && sudo apt upgrade -y

sudo apt install apache2 unzip wget -y

cd /tmp

wget https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip

unzip main.zip

cp -R /linux-site-dio-main/* /var/www/html/

ls /var/www/html



