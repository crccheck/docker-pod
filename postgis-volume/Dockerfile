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
# install postgres + postgis
RUN DEBIAN_FRONTEND=noninteractive apt-get install -yq postgresql-9.3-postgis-2.1 postgresql-contrib-9.3 postgresql-9.3-plv8 postgresql-client-9.3

RUN mkdir -p /data
# Update host-based authentification to let remote machines connect
# TODO change to 'md5'
RUN echo "host    all    all    0.0.0.0/0     trust" >> /etc/postgresql/9.3/main/pg_hba.conf
# Make sure postgresql is listening, send logs to /data/logs
RUN echo "listen_addresses = '*'\nlogging_collector = on\nlog_directory = '/data/logs'" >> /etc/postgresql/9.3/main/postgresql.conf
# Make logs easier for developers to work with
RUN echo "log_filename = 'postgresql.log'\nlog_file_mode=0644\nlog_truncate_on_rotation = on\nlog_rotation_age = 7d" >> /etc/postgresql/9.3/main/postgresql.conf

# Change data directory
RUN sed -i "s@^data_directory.+@data_directory = '/data/postgresql'@" /etc/postgresql/9.3/main/postgresql.conf

EXPOSE 5432

# Let other volumes read config
# VOLUME ["/etc/postgresql"]
VOLUME ["/data"]

# USER postgres

ADD start.sh /usr/local/bin/start.sh
CMD ["sh", "/usr/local/bin/start.sh"]
