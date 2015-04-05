IMAGE = crccheck/postgis
CONTAINER = postgis_1

# build an image
build:
	docker build -t $(IMAGE) .

build/force:
	docker build --no-cache -t $(IMAGE) .

# start a postgis container
run: clean
	docker run --detach --name $(CONTAINER) -v ~/volumes/$(CONTAINER):/data -p 5432 $(IMAGE)
	@echo "psql -U docker -h 127.0.0.1 -p $$(docker port $(CONTAINER) 5432 | cut -d : -f 2) docker"

# test start a postgis container
test: clean
	docker run --rm --name $(CONTAINER) -v ~/volumes/postgis:/data -p 5432 $(IMAGE)

# shell into a postgis container
shell: clean
	docker run --rm --name $(CONTAINER) -v ~/volumes/$(CONTAINER):/data -i -t $(IMAGE) bash

# shell into a postgis container linked to a running container
pshell:
	-docker rm $(CONTAINER)-debug 2> /dev/null
	docker run --rm --name $(CONTAINER)-debug --link $(CONTAINER):postgis -i -t \
	  $(IMAGE) bash

# psql to a running container
psql:
	-docker rm $(CONTAINER)-debug 2> /dev/null
	docker run --rm --name $(CONTAINER)-debug --link $(CONTAINER):postgis -i -t \
	  $(IMAGE) \
	  psql -U docker -h postgis -p 5432

kill:
	docker kill $(CONTAINER)

clean:
	-docker rm $(CONTAINER) 2> /dev/null

# copy all the config files for reference
.PHONY: config
config:
	docker cp $(CONTAINER):/etc/postgresql/9.4/main/ config

