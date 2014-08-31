# ## My Little Utility
#
# Simple Ubuntu container with convenient things I like built in already.

FROM ubuntu:14.04
MAINTAINER Chris <c@crccheck.com>

RUN apt-get update -qq
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install curl wget telnet apache2-utils > /dev/null
