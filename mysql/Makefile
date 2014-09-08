# Image Name:
image=crccheck/mysql
# Container Name:
mysql=tt-mysql

build:
	docker build -t $(image) .

# this is a mysql database I can use for local Tribune work
run:
	docker run --detach --name $(mysql) -P \
	  --env MYSQL_ROOT_PASSWORD='docker' \
	  --env MYSQL_DATABASE=tribune_dev \
	  --env MYSQL_USER=docker \
	  --env MYSQL_PASSWORD=docker \
	  --volume ${HOME}/volumes/$(mysql):/data \
	  $(image)

# shell in to poke around
shell:
	docker run --rm --name $(mysql)-debug -P \
	  --volumes-from $(mysql) \
	  --link $(mysql):mysql \
	  -i -t $(image) /bin/bash

clean:
	sudo rm -rf ${HOME}/volumes/$(mysql)/*
	dockr rm -f $(mysql) || true
