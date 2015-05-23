#!/bin/bash

set -e

LIST_NAME=${LIST_NAME:-logstash}
TYPE=${DOC_TYPE:-spew}
MAX_COUNT=${MAX_COUNT}
WORD_SOURCE=/usr/share/dict/words

COUNTER=0


while read line; do
  if [ -z "${MAX_COUNT}" ] || [ -z "${count}" ] || [ ${count} -lt ${MAX_COUNT} ]; then
    let COUNTER=COUNTER+1
    timestamp=$(date --utc +%FT%TZ)
    message="{\
\"message\":\"${line}\",\
\"@timestamp\":\"${timestamp}\",\
\"@version\":\"1\",\
\"type\":\"${TYPE}\",\
\"host\":\"logstash-redis-spewer\",\
\"path\":\"/root/beer.log\"\
}"
    count=$(redis-cli LPUSH ${LIST_NAME} $message)
  else
    count=$(redis-cli LLEN ${LIST_NAME})
  fi
  seconds=$(date +%S)
  if [ "${seconds}" != "${lastest}" ]; then
    echo ${LIST_NAME} ${count} ${COUNTER}
  fi
  lastest=${seconds}
  sleep 0.1
done <${WORD_SOURCE}
