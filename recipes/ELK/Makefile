# container names
elasticsearch=elasticsearch
kibana=kibana


run: run_elasticsearch run_kibana

# Elasticsearch
#
# TODO use a custom config and data volume
#
# https://github.com/dockerfile/elasticsearch
run_elasticsearch:
	docker run --detach -p 9200 -p 9300 --name=$(elasticsearch) \
	  dockerfile/elasticsearch

# Kibana
#
# https://github.com/arcus-io/docker-kibana
run_kibana:
	-docker rm $(kibana) 2>/dev/null
	docker run --detach \
	  --env ES_PORT=$$(docker port $(elasticsearch) 9200|cut -d: -f2) \
	  -p 80 --name=$(kibana) arcus/kibana
	echo $$(docker port $(kibana) 80)


start: start_elasticsearch

start_elasticsearch:
	docker start $(elasticsearch)
