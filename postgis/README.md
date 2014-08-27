Postgresql 9.3 + Postgis 2.1
============================

Features:
* Lets you use an external volume for data and logs
* en_US.UTF-8 locale
* includes postgresql-client packages so you can use this image to make utility
  containers

Login with `docker` and no password.

See Makefile for example usages.

References:
* Basic installation: http://www.ubuntuupdates.org/ppa/postgresql
* Original inspiration: https://github.com/orchardup/docker-postgresql/blob/master/Dockerfile
* Locale: https://github.com/x110dc/docker-postgres/blob/master/Dockerfile
* Structure of data/logs: https://registry.hub.docker.com/u/dockerfile/elasticsearch/
* Using external volumes for performance: http://www.davidmkerr.com/2014/06/postgresql-performance-on-docker.html

See my master repo at https://github.com/crccheck/docker-pod for more
information.
