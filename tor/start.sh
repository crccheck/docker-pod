#!/bin/sh
chown -R debian-tor /var/lib/tor
service tor start
sleep 1
tail -f /var/log/tor/log
