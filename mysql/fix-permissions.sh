#!/bin/bash
# fix permission changes that happen with remote mounted volumes

DATA_DIR=/mnt/mysql

chown -R mysql:docker $DATA_DIR
chmod -R ug+rw $DATA_DIR
