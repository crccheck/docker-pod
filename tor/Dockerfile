# ## tor
#
# Based on hsaito's docker-torbox, but I ended up needing to make significant
# modifications. Usage style inspired by the official elasticsearch Dockerfile.
#
# ### Example Usage:
#
# Run tor as a user and get a socks proxy:
#
#     dockr run --name tor-socks -p 9050:9050 -v $HOME/volumes/tor-socks:/var/lib/tor crccheck/tor
#
# Run a custom configuration file:
#
# First, have your own torrc file in ~/volumes/tor-relay/torrc, then:
#
#     dockr run --name tor-relay --net=host \
#       -v $HOME/volumes/tor-relay:/var/lib/tor crccheck/tor \
#       tor -f /var/lib/tor/torrc
#
# Generate a tor hashed password:
#
#     dockr run --rm crccheck/tor tor --quiet --hash-password hunter2
#
# References:
#
# * https://github.com/hsaito/docker-torbox
# * https://registry.hub.docker.com/u/dockerfile/elasticsearch/dockerfile/
# * https://www.torproject.org/docs/tor-manual.html.en


FROM debian:stable
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
