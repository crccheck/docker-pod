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
# -- web    this keeps the logstash process online (this really the best way?)
#
# https://registry.hub.docker.com/u/pointslope/logstash/dockerfile/
run_logstash:
	docker run --detach --name=$(logstash) \
	  --env ES_HOST=$$(dockr ip elasticsearch) \
	  --link elasticsearch:es \
	  --volume ${PWD}/data:/data \
	  pointslope/logstash \
	  /opt/logstash/bin/logstash agent --config /data/conf.d \
	    -- web

# Kibana
#
# https://github.com/arcus-io/docker-kibana
run_kibana:
	-docker rm $(kibana) 2>/dev/null
	docker run --detach \
	  --env ES_PORT=$$(docker port $(elasticsearch) 9200|cut -d: -f2) \
	  -p 80 --name=$(kibana) arcus/kibana
	echo $$(docker port $(kibana) 80)


start:
	docker start $(elasticsearch)
	docker start $(logstash)
	docker start $(kibana)


# you're going to want to interact with logstash:514
# example: telnet logstash $LOGSTASH_PORT_514_TCP_PORT
shell:
	docker run --rm -i -t --link $(logstash):logstash crccheck/zz /bin/bash

# send test message to logstash, port 3333 was defined as a tcp input in the config
hello:
	echo "hello" | nc $$(dockr ip logstash) 3333


.PHONY: data
data:
	docker run --detach --name=logstash-tmp pointslope/logstash
	docker cp logstash-tmp:/etc/logstash/conf.d data
	docker rm -f logstash-tmp