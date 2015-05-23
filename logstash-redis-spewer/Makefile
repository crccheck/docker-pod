NAME = logstash-redis-spewer

build:
	docker build -t $(NAME) .

bash:
	@-docker rm -f $(NAME)_temp 2>/dev/null || true
	docker run --rm --name $(NAME)_temp -it $(NAME) /bin/bash

spew:
	@-docker rm -f $(NAME)_temp 2>/dev/null || true
	docker run --rm --name $(NAME)_temp -it -e MAX_COUNT=1000 $(NAME)


elk:
	docker run -d --name=elk_1 -v ${PWD}/logstash_config/opt/logstash/conf.d \
	pblittle/docker-logstash
