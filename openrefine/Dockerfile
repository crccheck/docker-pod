# ## Open Refine 2.6 beta 1
#
# ### Usage Examples
#
# Starting the container:
#
#     docker run --name="refine" -P openrefine
#
# Find out which port to connect to:
#
#     docker ps
#
# Starting the container at the default address: http://localhost:3333
#
#     docker run --name="refine" -p 3333:3333 openrefine
#
# ### Links
#
# * Homepage: http://openrefine.org/index.html
# * FAQ: https://github.com/OpenRefine/OpenRefine/wiki/FAQ
# * Wiki: https://github.com/OpenRefine/OpenRefine/wiki

FROM ubuntu:precise
MAINTAINER Chris <c@crccheck.com>

ENV DEBIAN_FRONTEND noninteractive

# Java 7 and wget
RUN echo "deb http://archive.ubuntu.com/ubuntu precise universe" >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get -y install openjdk-7-jre-headless wget


# download and "install"
RUN wget --quiet --no-check-certificate https://github.com/OpenRefine/OpenRefine/releases/download/2.6-beta.1/openrefine-linux-2.6-beta.1.tar.gz
RUN tar -xzf openrefine-linux-2.6-beta.1.tar.gz && rm openrefine-linux-2.6-beta.1.tar.gz

EXPOSE 3333
VOLUME ["/mnt/refine"]

CMD ["openrefine-2.6-beta.1/refine", "-i", "0.0.0.0", "-d", "/mnt/refine"]
