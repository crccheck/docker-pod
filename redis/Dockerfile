# ## Redis
#
# Installs Redis Server v2.2.12, runs on port 6379

FROM ubuntu:precise
MAINTAINER Chris <c@crccheck.com>


RUN echo "deb http://archive.ubuntu.com/ubuntu precise universe" >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y redis-server && apt-get clean

CMD ["/usr/bin/redis-server"]
