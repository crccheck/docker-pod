#!/bin/bash

DATA_DIR=/mnt/mysql

sh fix-permissions.sh

if [ ! -d $DATA_DIR/mysql ]; then
    mysql_install_db

    /usr/bin/mysqld_safe --verbose &
    sleep 3
    # CREATE USER is implied
    mysql --execute="GRANT ALL PRIVILEGES ON *.* TO 'docker'@'%' WITH GRANT OPTION;"

    echo "stopping mysql..."
    killall mysqld
    sleep 2
fi

mysqld_safe --verbose

# TODO tail the logfile so attached session also acts as a log viewer
