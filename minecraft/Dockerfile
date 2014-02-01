# ## Minecraft 1.7.4
#
# ### Usage
#
# Run (has to be on port 25565):
#
#     docker run -d -p 25565:25565 -name="craft" minecraft
#
# References:
#
# * https://github.com/overshard/docker-minecraft/blob/master/Dockerfile
# * https://github.com/spikegrobstein/docker-minecraft-server/blob/master/Dockerfile
# * http://minecraft.gamepedia.com/Tutorials/Setting_up_a_server
# * http://www.minecraftforum.net/topic/420-tutorial-on-running-minecraft-on-a-dedicated-server/

FROM ubuntu:precise
MAINTAINER Chris <c@crccheck.com>

ENV DEBIAN_FRONTEND noninteractive

# Java 7 and wget
RUN echo "deb http://archive.ubuntu.com/ubuntu precise universe" >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get -y install openjdk-7-jre-headless wget

# Minecraft
RUN mkdir /minecraft
RUN cd /minecraft && wget https://s3.amazonaws.com/Minecraft.Download/versions/1.7.4/minecraft_server.1.7.4.jar


EXPOSE 25565
CMD ["java", "-jar", "/minecraft/minecraft_server.1.7.4.jar", "nogui"]
