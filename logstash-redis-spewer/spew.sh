#!/bin/bash

set -e

LIST_NAME=${LIST_NAME:-logstash}

WORD_SOURCE=/usr/share/dict/words

while read line; do
  count=$(redis-cli LPUSH ${LIST_NAME} $line)
  timestamp=$(date +%S)
  if [ "${timestamp}" != "${lastest}" ]; then
    echo ${LIST_NAME} ${count}
  fi
  lastest=${timestamp}
  sleep 0.1
done <${WORD_SOURCE}
