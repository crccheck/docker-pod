# ## Google Refine 2.5
#

FROM ubuntu:precise
MAINTAINER Chris <c@crccheck.com>

ENV DEBIAN_FRONTEND noninteractive

# Java 7 and wget
RUN echo "deb http://archive.ubuntu.com/ubuntu precise universe" >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get -y install openjdk-7-jre-headless wget


# elasticsearch
RUN wget --no-check-certificate https://github.com/OpenRefine/OpenRefine/releases/download/2.5/google-refine-2.5-r2407.tar.gz
RUN tar -xzf google-refine-2.5-r2407.tar.gz && rm google-refine-2.5-r2407.tar.gz

EXPOSE 3333

CMD ["google-refine-2.5/refine", "-i", "0.0.0.0"]
