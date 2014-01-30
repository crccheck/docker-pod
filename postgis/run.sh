#!/bin/bash

POSTGRESQL_BIN=/usr/lib/postgresql/9.3/bin/postgres
POSTGRESQL_CONFIG_FILE=/etc/postgresql/9.3/main/postgresql.conf

# start postgres and tail the log file

su postgres -c "$POSTGRESQL_BIN --config-file=$POSTGRESQL_CONFIG_FILE"\
  && tail -f /var/log/postgres/postgresql-9.3-main.log
