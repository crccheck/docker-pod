#!/bin/bash

# TODO use a real amount of memory
varnishd -f /usr/local/etc/varnish/default.vcl -s malloc,100M -a 0.0.0.0:80

varnishlog
