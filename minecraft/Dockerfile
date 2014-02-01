# ## Minecraft
#
# References:
#
# * https://github.com/overshard/docker-minecraft/blob/master/Dockerfile
# * https://github.com/spikegrobstein/docker-minecraft-server/blob/master/Dockerfile
# * http://minecraft.gamepedia.com/Tutorials/Setting_up_a_server
# * http://www.minecraftforum.net/topic/420-tutorial-on-running-minecraft-on-a-dedicated-server/

FROM ubuntu:precise
MAINTAINER Chris <c@crccheck.com>

ENV DEBIAN_FRONTEND noninteractiv

# Java 7 and wget
RUN echo "deb http://archive.ubuntu.com/ubuntu precise universe" >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get -y install openjdk-7-jre-headless wget
