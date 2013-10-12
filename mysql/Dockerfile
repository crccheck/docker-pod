# # Installs the current `mysql-server`, version 5.5 at the time of writing
#
# Getting Started
#
#     # cleanup old image
#     docker rmi mysql
#     # Build
#     docker build -t mysql .
#     # Use
#     docker run mysql
#     # Run in background (detached)
#     docker run -d mysql
#     # Run in background on port 3306
#     docker run -d -p 3306:3306 mysql
#     # Shell in
#     docker run -i -t mysql /bin/bash
#
# References:
# * https://github.com/kstaken/dockerfile-examples/tree/master/mysql-server
# * https://github.com/paulczar/docker-mysql/blob/master/Dockerfile
# * http://dischord.org/blog/2013/08/13/docker-and-owncloud-part-2/

FROM ubuntu:precise
MAINTAINER Chris <c@crccheck.com>


RUN apt-get update
RUN apt-get -y install mysql-server

# Put mysql data in a volume
# https://github.com/dotcloud/docker/wiki/Docker-0.3.0-release-note%2C-May-6-2013#data-volumes
VOLUME ["/var/lib/mysql"]

# TODO
# set mysql user's uid to some artificially high number
# this makes mounting remove volumes a little cleaner
# RUN usermod -u 10001 mysql
# RUN groupmod -g 10001 mysql

# Load extra mysql config files
ADD mysql-listen.cnf /etc/mysql/conf.d/mysql-listen.cnf

# Additional setup
ADD mysql-setup.sh /tmp/mysql-setup.sh
RUN /bin/sh /tmp/mysql-setup.sh

# Start mysql server
# "mysqld_safe is the recommended way to start a mysqld server on Unix."
CMD ["mysqld_safe"]

# EXPOSE 3306
