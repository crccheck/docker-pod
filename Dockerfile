FROM ubuntu:14.04
MAINTAINER elprans@sprymix.com

ENV APPDIR /srv/thumbor
ENV THUMBOR_VERSION 4.1.3
ENV OPENCV_ENGINE_VERSION 1.0.0

EXPOSE 80

VOLUME ["/etc/persistent-conf"]
VOLUME ["/srv/thumbor/storage"]
VOLUME ["/dev/log"]

ENTRYPOINT ["/init"]
CMD ["start"]

RUN DEBIAN_FRONTEND=noninteractive \
        apt-get update && apt-get install -y language-pack-en-base

ENV LANG en_US.UTF-8

RUN DEBIAN_FRONTEND=noninteractive \
        apt-get install -y \
                make patch wget unzip nginx zlib1g-dev libxml2-dev \
                libxslt-dev libcurl4-openssl-dev webp libpng-dev \
                libtiff-dev libjasper-dev libjpeg-dev libdc1394-22-dev \
                git python-dev python-pip python-numpy python-opencv \
        && apt-get clean

RUN mkdir -p /setup

ADD setup /setup
RUN DEBIAN_FRONTEND=noninteractive \
        /setup/install

ADD config /setup/config
RUN DEBIAN_FRONTEND=noninteractive \
        /setup/configure

ADD init /init
