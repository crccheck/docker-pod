# Copy fix from smartprocure/graphite instead of nesting base images to avoid
# spaghetti code and to maintain local control.
#
# References:
# https://registry.hub.docker.com/u/smartprocure/graphite/dockerfile/
FROM evarga/graphite
MAINTAINER Chris <c@crccheck.com>

# From smartprocure/graphite:
#
# Only needed one change from what Ervin Varga had in his repo.
RUN mkdir -p /var/run/apache2
