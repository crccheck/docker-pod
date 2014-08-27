#!/usr/bin/env bash

# strongly influenced by:
# https://github.com/orchardup/docker-postgresql/blob/master/run

set -e

POSTGRESQL_BIN=/usr/lib/postgresql/9.3/bin/postgres
POSTGRESQL_CONFIG_FILE=/etc/postgresql/9.3/main/postgresql.conf
POSTGRESQL_DATA=/var/lib/postgresql

# need to check this in case the user is using an external volume
if [ ! -d $POSTGRESQL_DATA ]; then
    mkdir -p $POSTGRESQL_DATA
    chown -R postgres:postgres $POSTGRESQL_DATA/..
    /usr/lib/postgresql/9.3/bin/initdb -D $POSTGRESQL_DATA
fi

$POSTGRESQL_BIN --single --config-file=$POSTGRESQL_CONFIG_FILE <<< \"CREATE USER docker WITH SUPERUSER;\"
$POSTGRESQL_BIN --config-file=$POSTGRESQL_CONFIG_FILE
