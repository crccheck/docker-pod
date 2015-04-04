#!/usr/bin/env bash

# strongly influenced by:
# https://github.com/orchardup/docker-postgresql/blob/master/run

set -e

POSTGRESQL_BIN=/usr/lib/postgresql/${POSTGRES_VERSION}/bin/postgres
POSTGRESQL_CONFIG_FILE=/etc/postgresql/${POSTGRES_VERSION}/main/postgresql.conf
POSTGRESQL_LOGS=/data/logs
POSTGRESQL_DATA=/data/postgresql


mkdir -p $POSTGRESQL_LOGS
chown -R postgres:postgres $POSTGRESQL_LOGS

if [ ! -d $POSTGRESQL_DATA ]; then
    mkdir -p $POSTGRESQL_DATA
    chown -R postgres:postgres $POSTGRESQL_DATA
    su postgres -c "/usr/lib/postgresql/${POSTGRES_VERSION}/bin/initdb -D $POSTGRESQL_DATA"
fi

su postgres -c "$POSTGRESQL_BIN --single --config-file=$POSTGRESQL_CONFIG_FILE <<< \"CREATE USER docker WITH SUPERUSER;\""
su postgres -c "$POSTGRESQL_BIN --single --config-file=$POSTGRESQL_CONFIG_FILE <<< \"CREATE DATABASE docker WITH OWNER=docker;\""
su postgres -c "$POSTGRESQL_BIN --config-file=$POSTGRESQL_CONFIG_FILE"
