# ## Varnish
#
# Installs Varnish Web Accelerator v3.0.2-1

FROM ubuntu:precise
MAINTAINER Chris <c@crccheck.com>


RUN echo "deb http://archive.ubuntu.com/ubuntu precise universe" >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y varnish && apt-get clean

# Make our custom VCLs available on the container
ADD vcl /usr/local/etc/varnish

EXPOSE :80

ADD start.sh /usr/local/bin/start.sh
CMD ["sh", "/usr/local/bin/start.sh"]
