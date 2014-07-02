## Cheatsheet for other useful Docker images

### Elasticsearch

Homepage: https://registry.hub.docker.com/u/dockerfile/elasticsearch/
Dockerfile: https://github.com/dockerfile/elasticsearch/blob/master/Dockerfile

Persistent data dir:

    docker run -d -p 9200:9200 -p 9300:9300 -v /mnt/elasticsearch:/data \
        --name="elasticsearch" dockerfile/elasticsearch

And with a custom YAML config located at /mnt/elasticsearch/elasticsearch.yml:

    docker run -d -p 9200:9200 -p 9300:9300 -v /mnt/elasticsearch:/data \
        --name="elasticsearch" dockerfile/elasticsearch \
        /elasticsearch/bin/elasticsearch -Des.config=/data/elasticsearch.yml
