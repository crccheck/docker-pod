# ## Postgresql 9.3 + Postgis 2.1 + friends
#
# A Postgresql 9.3 + Postgis 2.1 image with hstore, plv8, and more!
#
# ### Example Usage
#
# Start container for the first time:
#
#     docker run -p 5432:5432 --name="postgis" crccheck/postgis
#
#
# Tail the log:
#
#     docker attach pgplus
#
# Stop
#
#     docker stop pgplus
#
# Start it again
#
#    docker start pgplus
#
# References:
# * http://docs.docker.io/en/latest/examples/postgresql_service/
# * https://github.com/Painted-Fox/docker-postgresql/blob/master/Dockerfile
# * https://github.com/orchardup/docker-postgresql/blob/master/Dockerfile
# * http://www.ubuntuupdates.org/ppa/postgresql

FROM ubuntu:precise
MAINTAINER Chris <c@crccheck.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -y wget && apt-get clean

# Add Postgres PPA
# --no-check-certificate workaround for:
#     "ERROR: cannot verify www.postgresql.org's certificate"
RUN wget --no-check-certificate --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main" >> /etc/apt/sources.list.d/postgresql.list

# add universe
RUN echo "deb http://archive.ubuntu.com/ubuntu precise universe" >> /etc/apt/sources.list

RUN apt-get update
RUN apt-get install -y postgresql-9.3-postgis-2.1 postgresql-contrib-9.3 postgresql-9.3-plv8 && apt-get clean

# Allow connections from anywhere.
RUN sed -i -e"s/^#listen_addresses =.*$/listen_addresses = '*'/" /etc/postgresql/9.3/main/postgresql.conf
RUN echo "host    all    all    0.0.0.0/0    md5" >> /etc/postgresql/9.3/main/pg_hba.conf

EXPOSE 5432
VOLUME ['/var/lib/postgresql/9.3/main', '/var/log/postgresql']

ADD start.sh /
RUN sh /start.sh

ADD run.sh /
CMD ["/bin/sh", "/run.sh"]
