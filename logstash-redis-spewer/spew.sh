#!/bin/bash

set -e

LIST_NAME=${LIST_NAME:-logstash}
TYPE=${DOC_TYPE:-spew}

WORD_SOURCE=/usr/share/dict/words


while read line; do
  timestamp=$(date --utc +%FT%TZ)
  message="{\
\"message\":\"${line}\",\
\"@timestamp\":\"${timestamp}\",\
\"@version\":\"1\",\
\"type\":\"${TYPE}\",\
\"host\":\"logstash-redis-spewer\",\
\"path\":\"/root/beer.log\"\
}"
  echo $message
  count=$(redis-cli LPUSH ${LIST_NAME} $message)
  seconds=$(date +%S)
  if [ "${seconds}" != "${lastest}" ]; then
    echo ${LIST_NAME} ${count}
  fi
  lastest=${seconds}
  sleep 0.1
done <${WORD_SOURCE}
