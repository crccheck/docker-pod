#!/bin/bash

DATA_DIR=/var/lib/mysql

if [ ! -d $DATA_DIR/mysql ]; then
    chown -R mysql:mysql $DATA_DIR
    mysql_install_db

    /usr/bin/mysqld_safe --verbose &
    sleep 3
    # CREATE USER is implied
    mysql --execute="GRANT ALL PRIVILEGES ON *.* TO 'docker'@'%' WITH GRANT OPTION;"

    echo "stopping mysql..."
    killall mysqld
    sleep 2
fi

mysqld_safe

# TODO tail the logfile so attached session also acts as a log viewer
