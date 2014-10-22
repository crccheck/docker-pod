# ## My Little Utility
#
# Simple Ubuntu container with convenient things I like built in already.
# TODO prioritize image size so I can download this image faster

FROM ubuntu:14.04
MAINTAINER Chris <c@crccheck.com>

RUN apt-get update -qq
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install curl wget telnet apache2-utils
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install make vim
RUN curl --location --silent \
  https://github.com/crccheck/dotfiles/archive/master.tar.gz | \
  tar xz --exclude="gnome-terminal" --exclude="iterm" --exclude="resources" \
  --exclude="sublime-text-2" --exclude="virtualenv" && \
  mv dotfiles-master /root/.dotfiles
# WISHLIST don't litter stuff around /, change $HOME ?
RUN cd /root/.dotfiles && make dotfiles vim
