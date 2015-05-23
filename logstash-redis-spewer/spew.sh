#!/bin/bash

MESSAGE=hi

LIST_NAME=${LIST_NAME:-logstash}

WORD_SOURCE=/usr/share/dict/words

while read line; do
    redis-cli LPUSH ${LIST_NAME} $line
    sleep 1
done <${WORD_SOURCE}
