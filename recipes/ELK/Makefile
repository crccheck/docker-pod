# container names
elasticsearch=elasticsearch


build: build_elasticsearch

# Elasticsearch
#
# TODO use a custom config and data volume
#
# https://github.com/dockerfile/elasticsearch
build_elasticsearch:
	docker run --detach -d -p 9200:9200 -p 9300:9300 --name=$(elasticsearch) dockerfile/elasticsearch


start: start_elasticsearch

start_elasticsearch:
	docker start $(elasticsearch)
