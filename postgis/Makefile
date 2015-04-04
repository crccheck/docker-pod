# build an image
build:
	docker build -t crccheck/postgis .

build/force:
	docker build --no-cache -t crccheck/postgis .

# start a postgis container
run: clean
	docker run --detach --name postgis -v ~/volumes/postgis:/data -p 5432 crccheck/postgis
	@echo "psql -U docker -h 127.0.0.1 -p $$(docker port postgis 5432 | cut -d : -f 2) docker"

# test start a postgis container
test: clean
	docker run --rm --name postgis -v ~/volumes/postgis:/data -p 5432 crccheck/postgis

# shell into a postgis container
shell: clean
	docker run --rm --name postgis -v ~/volumes/postgis:/data -i -t crccheck/postgis bash

# shell into a postgis container linked to a running container
pshell:
	-docker rm postgis-debug 2> /dev/null
	docker run --rm --name postgis-debug --link postgis:postgis -i -t \
	  crccheck/postgis bash

# psql to a running container
psql:
	-docker rm postgis-debug 2> /dev/null
	docker run --rm --name postgis-debug --link postgis:postgis -i -t \
	  crccheck/postgis \
	  psql -U docker -h postgis -p 5432

kill:
	docker kill postgis

clean:
	-docker rm postgis 2> /dev/null

# copy all the config files for reference
.PHONY: config
config:
	docker cp postgis:/etc/postgresql/9.3/main/ config

