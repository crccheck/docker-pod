#!/bin/bash

# strongly influenced by:
# https://github.com/orchardup/docker-postgresql/blob/master/run

set -e

POSTGRESQL_BIN=/usr/lib/postgresql/9.3/bin/postgres
POSTGRESQL_CONFIG_FILE=/etc/postgresql/9.3/main/postgresql.conf


su postgres -c "$POSTGRESQL_BIN --single --config-file=$POSTGRESQL_CONFIG_FILE <<< \"CREATE USER docker WITH SUPERUSER;\""
su postgres -c "$POSTGRESQL_BIN --single --config-file=$POSTGRESQL_CONFIG_FILE <<< \"CREATE DATABASE docker OWNER docker;\""
# su postgres -c "$POSTGRESQL_BIN --config-file=$POSTGRESQL_CONFIG_FILE"
