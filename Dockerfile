# ## tor
#
# Based on hsaito's docker-torbox, but I ended up needing to make significant
# modifications. Usage style inspired by the official elasticsearch Dockerfile.
#
# ### Example Usage:
#
# Run tor as a user and get a socks proxy
#
#     dockr run --name tor-socks -p 9050:9050 -v $HOME/volumes/tor-socks:/var/lib/tor crccheck/tor
#
# References:
#
# * https://github.com/hsaito/docker-torbox
# * https://registry.hub.docker.com/u/dockerfile/elasticsearch/dockerfile/


FROM debian:stable
MAINTAINER Chris <c@crccheck.com>


RUN echo "deb http://deb.torproject.org/torproject.org wheezy main" >> /etc/apt/sources.list
RUN gpg --keyserver keys.gnupg.net --recv 886DDD89
RUN gpg --export A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89 | apt-key add -
RUN apt-get -qq update

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y tor

ADD torrc /etc/tor/torrc
ADD start.sh /start.sh

# expose relay port
EXPOSE 9001
# expose socks port
EXPOSE 9050
# expose control port
EXPOSE 9051
# expose data and log
VOLUME ["/var/lib/tor", "/var/logs/tor"]

CMD ["/start.sh"]
