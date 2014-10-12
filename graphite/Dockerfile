# Copy fix from smartprocure/graphite instead of nesting base images to avoid
# spaghetti code and to maintain local control.
#
# References:
# https://github.com/evarga/docker-images/tree/master/graphite
# https://registry.hub.docker.com/u/smartprocure/graphite/dockerfile/
FROM evarga/graphite
MAINTAINER Chris <c@crccheck.com>

# From smartprocure/graphite:
#
# Only needed one change from what Ervin Varga had in his repo.
RUN mkdir -p /var/run/apache2

# Expose log files
# XXX should I just adjust the config files to send them to a mount instead?
VOLUME ["/var/log/apache2", "/var/log/supervisor"]

ADD fix-permissions.sh /fix-permissions.sh
ENTRYPOINT ["/fix-permissions.sh"]

# need to re-iterate this after adding ENTRYPOINT
# NOTE: supervisord.conf has "nodaemon = true" set
CMD ["/usr/bin/supervisord"]
