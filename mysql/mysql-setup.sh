#!/bin/bash

/usr/bin/mysqld_safe &
sleep 2
# CREATE USER is implied
mysql -p --execute="GRANT ALL PRIVILEGES ON *.* TO 'docker'@'%' WITH GRANT OPTION;"
