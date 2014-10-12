NAME=graphite
VOLUME_BASE=$(HOME)/volumes/$(NAME)


# You should run `make conf storage` prior to running this the first time or
# else the configuration files won't get loaded and the database won't be
# initialized.
run:
	@mkdir -p $(VOLUME_BASE)/storage
	@mkdir -p $(VOLUME_BASE)/log/apache2
	@mkdir -p $(VOLUME_BASE)/log/supervisor
	docker run -d --name graphite \
	  -v $(VOLUME_BASE)/conf:/opt/graphite/conf \
	  -v $(VOLUME_BASE)/log/apache2:/var/log/apache2 \
	  -v $(VOLUME_BASE)/log/supervisor:/var/log/supervisor \
	  -v $(VOLUME_BASE)/storage:/opt/graphite/storage \
	  crccheck/graphite

# variation of `run` that cleans and runs in the foreground
# could be more DRY, but meh
run_debug:
	sudo rm -rf $(VOLUME_BASE)/storage
	rm -rf $(VOLUME_BASE)/log

	@mkdir -p $(VOLUME_BASE)/storage
	@mkdir -p $(VOLUME_BASE)/log/apache2
	@mkdir -p $(VOLUME_BASE)/log/supervisor
	docker run --rm --name graphite \
	  -v $(VOLUME_BASE)/conf:/opt/graphite/conf \
	  -v $(VOLUME_BASE)/log/apache2:/var/log/apache2 \
	  -v $(VOLUME_BASE)/log/supervisor:/var/log/supervisor \
	  -v $(VOLUME_BASE)/storage:/opt/graphite/storage \
	  crccheck/graphite


bash:
	dockr bash evarga/graphite


# copy the default configuration for reference
conf:
	docker run --rm --name tmp-graphite evarga/graphite \
	  tar -c --directory /opt/graphite conf | tar -xv --directory $(VOLUME_BASE)


# copy the default configuration for reference
storage:
	docker run --rm --name tmp-graphite evarga/graphite \
	  tar -c --directory /opt/graphite storage | tar -xv --directory $(VOLUME_BASE)
