# ## Elasticsearch
# References:
# * Example Dockerfile http://dahernan.github.io/2013/08/04/docker-to-run-elasticsearch/
# * Simpler Java https://gist.github.com/wingdspur/2026107

FROM ubuntu:precise
MAINTAINER Chris <c@crccheck.com>

# Java 7 and wget
RUN echo "deb http://archive.ubuntu.com/ubuntu precise universe" >> /etc/apt/sources.list
RUN apt-get update
# TODO try oracle-java7-installer
RUN apt-get -y install openjdk-7-jre-headless wget

# elasticsearch
RUN wget --no-check-certificate https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-0.20.2.tar.gz
RUN tar -xzf elasticsearch-0.20.2.tar.gz && rm elasticsearch-0.20.2.tar.gz

EXPOSE :9200

CMD elasticsearch-0.20.2/bin/elasticsearch -f
