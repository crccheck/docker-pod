#!/bin/bash

/usr/bin/mysqld_safe &
sleep 2
mysql -p --execute="GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;"
