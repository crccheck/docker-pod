# Based on https://github.com/sprymix/docker-thumbor
# and https://github.com/miracle2k/dockerfiles/tree/master/thumbor
FROM ubuntu:14.04
MAINTAINER c@crccheck.com

ENV APPDIR /srv/thumbor
# see https://github.com/thumbor/thumbor/releases
ENV THUMBOR_VERSION 4.8.5
# see https://github.com/thumbor/opencv-engine/releases
# ENV OPENCV_ENGINE_VERSION 1.0.0
ENV THUMBOR_ENGINE graphicsmagick
# see https://github.com/thumbor/graphicsmagick-engine/releases
ENV GRAPHICSMAGICK_ENGINE_VERSION 0.1.1

EXPOSE 8888

VOLUME ["/etc/persistent-conf"]
VOLUME ["/srv/thumbor/storage"]
VOLUME ["/dev/log"]

ENTRYPOINT ["/init"]
CMD ["start"]

RUN apt-get update -qq
# why do I need this?
RUN DEBIAN_FRONTEND=noninteractive \
    apt-get install --no-install-recommends -y language-pack-en-base > /dev/null
ENV LANG en_US.UTF-8

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y \
    patch wget unzip python-dev python-pip > /dev/null && \
    apt-get clean

ADD setup /setup
RUN DEBIAN_FRONTEND=noninteractive /setup/install > /dev/null

ADD config /setup/config
RUN DEBIAN_FRONTEND=noninteractive /setup/configure > /dev/null

ADD init /init
