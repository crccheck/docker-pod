NAME=graphite
VOLUME_BASE=$(HOME)/volumes/$(NAME)


test:
	echo $(VOLUME_BASE)

# you should run `make conf` prior to running this the first time or else
# the configuration files won't get loaded
#
# you'll need to mess with the permissions so the container's www-data user can
# write to $(VOLUME_BASE)/storage/log/webapp
#
# TODO get storage to work?
run:
	# @mkdir -p $(VOLUME_BASE)/storage
	@mkdir -p $(VOLUME_BASE)/log/apache2
	@mkdir -p $(VOLUME_BASE)/log/supervisor
	docker run -d --name graphite \
	  -v $(VOLUME_BASE)/conf:/opt/graphite/conf \
	  -v $(VOLUME_BASE)/log/apache2:/var/log/apache2 \
	  -v $(VOLUME_BASE)/log/supervisor:/var/log/supervisor \
	  crccheck/graphite
	  # -v $(VOLUME_BASE)/storage:/opt/graphite/storage \


bash:
	dockr bash evarga/graphite


# copy the default configuration for reference
conf:
	docker run -d --name tmp-graphite evarga/graphite
	docker cp tmp-graphite:/opt/graphite/conf $(VOLUME_BASE)
	docker rm -f tmp-graphite
	@echo "Graphite config files are now at $(VOLUME_BASE)/conf"
