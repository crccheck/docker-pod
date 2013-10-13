# ## `mysql-server`
#
# A mysql image (version 5.5 at the time of writing) that supports external
# volumes. The login is `docker` with no password.
#
# ### Example Usage
#
# Run in background on port 3306 storing files in `~/volumes/mysql`:
#
#     docker run -d -p 3306:3306 -v ~/volumes/mysql:/mnt/mysql/ mysql
#
# Fix fubar'd permissions in the remote volume:
#
#     docker run -v ~/volumes/mysql:/mnt/mysql/ mysql sh /usr/local/bin/fix-permissions.sh
#
# References:
# * https://github.com/kstaken/dockerfile-examples/tree/master/mysql-server
# * https://github.com/paulczar/docker-mysql/blob/master/Dockerfile
# * http://dischord.org/blog/2013/08/13/docker-and-owncloud-part-2/

FROM ubuntu:precise
MAINTAINER Chris <c@crccheck.com>


RUN apt-get update
RUN apt-get -y install mysql-server

# Load extra mysql config files
ADD mysql-listen.cnf /etc/mysql/conf.d/mysql-listen.cnf

ADD setup.sh /tmp/setup.sh
RUN /bin/sh /tmp/setup.sh
ADD fix-permissions.sh /usr/local/bin/fix-permissions.sh

# Put mysql data in a volume
# https://github.com/dotcloud/docker/wiki/Docker-0.3.0-release-note%2C-May-6-2013#data-volumes
VOLUME ["/mnt/mysql"]

# Start mysql server
ADD start.sh /usr/local/bin/start.sh
CMD ["sh", "/usr/local/bin/start.sh"]
