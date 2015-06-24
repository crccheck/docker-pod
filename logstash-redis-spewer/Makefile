NAME = logstash-redis-spewer

build:
	docker build -t $(NAME) .

bash:
	@-docker rm -f $(NAME)_temp 2>/dev/null || true
	docker run --rm --name $(NAME)_temp -it $(NAME) /bin/bash

run:
	@-docker rm -f $(NAME)_1 2>/dev/null || true
	docker run -d --name $(NAME)_1 -it -e MAX_COUNT=1000 $(NAME)

spew:
	@-docker rm -f $(NAME)_temp 2>/dev/null || true
	docker run --rm --name $(NAME)_temp -it -e MAX_COUNT=1000 $(NAME)

tail:
	docker logs --follow $(NAME)_1

elk: run
	@-docker rm -f spew_elk 2>/dev/null || true
	docker run -d --name=spew_elk \
	  -v ${PWD}/logstash_config:/opt/logstash/conf.d \
	  --link $(NAME)_1:redis \
	  -p 9200:9200 \
	  -p 9292:9292 \
	  pblittle/docker-logstash

elk/bash:
	@-docker rm -f spew_elk_temp 2>/dev/null || true
	docker run --name spew_elk_temp \
	  -v ${PWD}/logstash_config:/opt/logstash/conf.d \
	  --entrypoint=/bin/bash -it \
	  --link $(NAME)_1:redis \
	  pblittle/docker-logstash
