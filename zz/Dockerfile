# ## My Little Utility
#
# Simple Ubuntu container with convenient things I like built in already.
# TODO prioritize image size so I can download this image faster

FROM ubuntu:14.04
MAINTAINER Chris <c@crccheck.com>

RUN apt-get update -qq && \
      DEBIAN_FRONTEND=noninteractive apt-get -y install \
      curl wget telnet \
      # for apachebench
      apache2-utils \
      make vim
      # don't delete cache to make it easier to install things
WORKDIR /root
RUN curl --location --silent \
  https://github.com/crccheck/dotfiles/archive/master.tar.gz | \
  tar xz --exclude="gnome-terminal" --exclude="iterm" --exclude="resources" \
  --exclude="sublime-text-2" --exclude="sublime-text-3" --exclude="virtualenv" && \
  mv dotfiles-master /root/.dotfiles
# WISHLIST don't litter stuff around /, change $HOME ?
RUN cd /root/.dotfiles && make dotfiles vim
