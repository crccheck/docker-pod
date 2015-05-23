NAME = logstash-redis-spewer

build:
	docker build -t $(NAME) .


bash:
	@-docker rm -f $(NAME)_temp 2>/dev/null || true
	docker run --rm --name $(NAME)_temp -it $(NAME) /bin/bash
