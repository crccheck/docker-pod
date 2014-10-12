#!/usr/bin/env bash
# Fix permissions issues that can happen when using external volumes

# not sure why I need to manually do this
mkdir -p /opt/graphite/storage/log/webapp

# from the original Dockerfile
# https://github.com/evarga/docker-images/blob/master/graphite/Dockerfile
chown -R www-data /opt/graphite/storage

# continue to run CMD
exec "$@"
