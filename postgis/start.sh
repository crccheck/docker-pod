#!/bin/bash

# strongly influenced by:
# https://github.com/orchardup/docker-postgresql/blob/master/run

set -e

POSTGRESQL_CONFIG_FILE=/etc/postgresql/9.3/main/postgresql.conf
POSTGRESQL_BIN=/usr/lib/postgresql/9.3/bin
POSTGRESQL_DATA=/var/lib/postgresql/9.3


if [ ! -d $POSTGRESQL_DATA ]; then
    mkdir -p $POSTGRESQL_DATA
    chown -R postgres:postgres $POSTGRESQL_DATA/..
    su postgres -c "$POSTGRESQL_BIN/initdb -D $POSTGRESQL_DATA"
fi

su postgres -c "$POSTGRESQL_BIN/postgres --single --config-file=$POSTGRESQL_CONFIG_FILE <<< \"CREATE USER docker WITH SUPERUSER;\""
su postgres -c "$POSTGRESQL_BIN/postgres --single --config-file=$POSTGRESQL_CONFIG_FILE <<< \"CREATE DATABASE docker OWNER docker;\""
# su postgres -c "$POSTGRESQL_BIN --config-file=$POSTGRESQL_CONFIG_FILE"
