#!/bin/bash

/usr/bin/mysqld_safe &
sleep 5
mysql -p --execute="GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;"
