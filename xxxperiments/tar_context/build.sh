#!/usr/bin/env bash

# Demo of how to send a build context to Docker that respects .dockerignore

# If you want to exclude any line that contains a '#'. Useful hack to send
# files to tar but not Docker:
#
# excludes=$(cat .dockerignore | awk '$0 !~ /#/ { print "--exclude=\""$1"\"" }')

excludes=$(cat .dockerignore | awk '$1 !~ /^#/ { print "--exclude=\""$1"\"" }')

# create a context to send to Docker
# $excludes      only send some files
# --dereference  resolve symlinks
# --to-stdout    send to stdout instead of a file
# -c             create
# .              send everything in PWD
tar -c $excludes --dereference --to-stdout . | docker build -
