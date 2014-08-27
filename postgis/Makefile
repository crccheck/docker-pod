build:
	docker build -t crccheck/postgis .


run:
	-docker rm postgis 2> /dev/null
	 docker run --detach --name postgis -v ~/volumes/postgis:/data -p 5432 crccheck/postgis
	@echo "psql -U docker -h 127.0.0.1 -p $$(docker port postgis 5432 | cut -d : -f 2) docker"

test:
	docker run --rm --name postgis -v ~/volumes/postgis:/data -p 5432 crccheck/postgis

kill:
	docker kill postgis

shell:
	docker run --rm --name postgis -v ~/volumes/postgis:/data -i -t crccheck/postgis bash


# copy all the config files for reference
.PHONY: config
config:
	docker cp postgis:/etc/postgresql/9.3/main/ config

