FROM debian:wheezy
MAINTAINER c@crccheck.com


RUN apt-get update -qq
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install curl

# Install httperf
# TODO move httpie to its own dockerfile
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install autoconf libtool make
RUN curl -L https://github.com/jmervine/httperf/archive/master.tar.gz | tar xz
RUN cd /httperf-master && autoreconf -i
RUN mkdir /httperf-master/build
RUN cd /httperf-master/build && ../configure && make && make install

# Install ruby 1.9.3p194
RUN apt-get install -y ruby

# Install autoperf
RUN gem install autoperf

ENTRYPOINT ['/usr/local/bin/autoperf']
