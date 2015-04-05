# ## PostgreSQL+PostGIS
#
# A PostgreSQL + Postgis image that supports external volumes.
# https://github.com/crccheck/docker-postgis

FROM ubuntu:14.04
MAINTAINER Chris <c@crccheck.com>

RUN apt-get update -qq

# Change locale to UTF-8 from standard locale ("C")
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install language-pack-en > /dev/null
ENV LANGUAGE en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8
RUN DEBIAN_FRONTEND=noninteractive locale-gen en_US.UTF-8
RUN DEBIAN_FRONTEND=noninteractive dpkg-reconfigure locales
RUN update-locale LANG=en_US.UTF-8

ENV POSTGRES_VERSION 9.4
ENV POSTGIS_VERSION 2.1

# Add Postgres PPA
ADD https://www.postgresql.org/media/keys/ACCC4CF8.asc /tmp/ACCC4CF8.asc
RUN apt-key add /tmp/ACCC4CF8.asc
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main" >> /etc/apt/sources.list

RUN apt-get update -qq

# Install postgres + postgis + client tools so we can use this image as a
# postgres utility container too
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y \
  postgresql-${POSTGRES_VERSION}-postgis-${POSTGIS_VERSION} \
  postgresql-contrib-${POSTGRES_VERSION} \
  postgresql-${POSTGRES_VERSION}-plv8 \
  postgresql-client-${POSTGRES_VERSION} \
  > /dev/null

# Update host-based authentification to let remote machines connect
# TODO change to 'md5'?
RUN echo "host    all    all    0.0.0.0/0     trust" >> /etc/postgresql/${POSTGRES_VERSION}/main/pg_hba.conf
# Make sure postgresql is listening, send logs to /data/logs
RUN echo "listen_addresses = '*'\nlogging_collector = on\nlog_directory = '/data/logs'" >> /etc/postgresql/${POSTGRES_VERSION}/main/postgresql.conf
# Make logs easier for developers to work with
RUN echo "log_filename = 'postgresql.log'\nlog_file_mode=0644\nlog_truncate_on_rotation = on\nlog_rotation_age = 7d" >> /etc/postgresql/${POSTGRES_VERSION}/main/postgresql.conf

# Change data directory
RUN sed -i "s@^data_directory.+@data_directory = '/data/postgresql'@" /etc/postgresql/${POSTGRES_VERSION}/main/postgresql.conf

EXPOSE 5432

# Let other volumes read config and logs
RUN mkdir /data
VOLUME ["/data"]

ADD start.sh start.sh
CMD ["sh", "start.sh"]
