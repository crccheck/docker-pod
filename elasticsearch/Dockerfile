# ## Elasticsearch
#
# References:
#
# * Example Dockerfile http://dahernan.github.io/2013/08/04/docker-to-run-elasticsearch/
# * Simpler Java https://gist.github.com/wingdspur/2026107

FROM ubuntu:precise
MAINTAINER Chris <c@crccheck.com>

# Java 7 and wget
RUN echo "deb http://archive.ubuntu.com/ubuntu precise universe" >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get -y install openjdk-7-jre-headless wget

# TODO try oracle-java7-installer
# I tried this and my image was 787.2 MB (oracle-java7) vs 503.2 MB (openjdk-7)
# RUN apt-get install software-properties-common
# RUN apt-apt-repository ppa:webupd8team/java
# RUN apt-get update
# RUN echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
# RUN apt-get install -y oracle-java7-installer wget

# elasticsearch
RUN wget --no-check-certificate https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-0.90.5.tar.gz
RUN tar -xzf elasticsearch-0.90.5.tar.gz && rm elasticsearch-0.90.5.tar.gz

EXPOSE :9200

# TODO do permissions better
VOLUME ["/elasticsearch-0.90.5/data"]

CMD elasticsearch-0.90.5/bin/elasticsearch -f
