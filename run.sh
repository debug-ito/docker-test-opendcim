#!/bin/sh

service mysql start
service apache2 start
mysql -e "CREATE DATABASE dcim; GRANT ALL ON dcim.* TO 'dcim'@'localhost' IDENTIFIED BY 'dcim';"
/bin/bash $*
