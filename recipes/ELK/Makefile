# container names
elasticsearch=elasticsearch
logstash=logstash
kibana=kibana


# References:
#
# * http://evanhazlett.com/2013/08/logstash-and-kibana-via-docker/
# * https://registry.hub.docker.com/u/pblittle/docker-logstash/

run: run_elasticsearch run_logstash run_kibana

# Elasticsearch
#
# TODO use a custom config and data volume
#
# https://github.com/dockerfile/elasticsearch
run_elasticsearch:
	docker run --detach -p 9200 -p 9300 --name=$(elasticsearch) \
	  dockerfile/elasticsearch

# Logstash
#
# TODO use a linked container w/ elasticsearch
#
# https://github.com/arcus-io/docker-logstash/blob/master/run.sh
run_logstash:
	docker run --detach --name=$(logstash) \
	  --env ES_HOST=$$(dockr ip elasticsearch) \
	  arcus/logstash

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
