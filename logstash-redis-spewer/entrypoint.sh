#!/bin/bash
service redis-server start
sleep 1

exec "$@"
