FROM ubuntu:14.04

MAINTAINER Chris <c@crccheck.com>

RUN apt-get update -qq
RUN DEBIAN_FRONTEND=noninteractive apt-get install redis-server redis-tools -y > /dev/null

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 6379
