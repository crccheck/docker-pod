#!/bin/bash

# strongly influenced by:
# https://github.com/orchardup/docker-postgresql/blob/master/run

set -e

POSTGRESQL_BIN=/usr/lib/postgresql/9.2/bin/postgres
POSTGRESQL_CONFIG_FILE=/etc/postgresql/9.2/main/postgresql.conf
POSTGRESQL_DATA=/mnt/postgres/9.2

if [ ! -d $POSTGRESQL_DATA ]; then
    mkdir -p $POSTGRESQL_DATA
    chown -R postgres:postgres $POSTGRESQL_DATA/..
    su postgres -c "/usr/lib/postgresql/9.2/bin/initdb -D $POSTGRESQL_DATA"
fi


su postgres -c "$POSTGRESQL_BIN --single --config-file=$POSTGRESQL_CONFIG_FILE <<< \"CREATE USER docker WITH SUPERUSER;\""
su postgres -c "$POSTGRESQL_BIN --single --config-file=$POSTGRESQL_CONFIG_FILE <<< \"CREATE DATABASE docker OWNER docker;\""
# su postgres -c "$POSTGRESQL_BIN --config-file=$POSTGRESQL_CONFIG_FILE"
