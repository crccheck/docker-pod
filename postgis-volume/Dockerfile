# ## Postgresql 9.3 and Postgis 2.1
#
# A Postgresql 9.3 + Postgis 2.1 image that supports external volumes. Runs on
# port 5432.
#
# ### Example Usage
#
#     docker run -d -v ~/volumes/postgres/:/mnt/postgres/ crccheck/postgis
#
# References:
# * https://github.com/orchardup/docker-postgresql/blob/master/Dockerfile
# * http://www.ubuntuupdates.org/ppa/postgresql

FROM ubuntu:14.04
MAINTAINER Chris <c@crccheck.com>


RUN apt-get update -qq
RUN DEBIAN_FRONTEND=noninteractive apt-get install -yq wget

# Add Postgres PPA
# --no-check-certificate workaround for:
#     "ERROR: cannot verify www.postgresql.org's certificate"
RUN wget --no-check-certificate --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main" >> /etc/apt/sources.list

# add universe
# RUN echo "deb http://archive.ubuntu.com/ubuntu trusty universe" >> /etc/apt/sources.list

RUN apt-get update -qq
RUN DEBIAN_FRONTEND=noninteractive apt-get install -yq postgresql-9.3-postgis-2.1 postgresql-contrib-9.3 postgresql-9.3-plv8 postgresql-client-9.3

RUN echo "host    all             all             0.0.0.0/0               md5" >> /etc/postgresql/9.3/main/pg_hba.conf
RUN echo "listen_addresses = '*'" >> /etc/postgresql/9.3/main/postgresql.conf
# RUN chown postgres:postgres -R /etc/postgresql/9.2/main/

EXPOSE 5432

VOLUME ["/etc/postgresql", "/var/log/postgresql", "/var/lib/postgresql"]

USER postgres

ADD start.sh /usr/local/bin/start.sh
CMD ["sh", "/usr/local/bin/start.sh"]

# useful reference:
# https://github.com/orchardup/docker-postgresql
