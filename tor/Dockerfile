# tor
#
# https://github.com/crccheck/docker-tor
#

FROM debian:wheezy
MAINTAINER Chris <c@crccheck.com>

RUN echo "deb http://deb.torproject.org/torproject.org wheezy main" >> /etc/apt/sources.list
RUN gpg --keyserver keys.gnupg.net --recv 886DDD89
RUN gpg --export A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89 | apt-key add -
RUN apt-get -qq update

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y tor

ADD torrc /etc/tor/torrc

# expose relay port
EXPOSE 9001
# expose socks port
EXPOSE 9050
# expose control port
EXPOSE 9051
# expose data
VOLUME ["/data"]

WORKDIR /data

# can't do this neatly with external volumes
# USER debian-tor

CMD ["/usr/sbin/tor"]
