FROM ubuntu:14.04

MAINTAINER Chris <c@crccheck.com>

RUN apt-get update -qq

# https://launchpad.net/ubuntu/trusty/+source/redis
ENV REDIS_SERVER_VERSION=2:2.8.4-2

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y \
      redis-server=${REDIS_SERVER_VERSION} redis-tools \
      # 'murica
      wamerican \
      > /dev/null
EXPOSE 6379

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

COPY spew.sh /spew.sh
CMD ["/spew.sh"]
