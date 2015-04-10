I use the official Elasticsearch, `elasticsearch`, unless I need an old
version, then I use `barnybug/elasticsearch`

* https://registry.hub.docker.com/u/barnybug/elasticsearch/dockerfile/


#### Regular/Latest Elasticsearch

    $ docker run -d --name=elasticsearch1 elasticsearch

### Elasticsearch 1.0.2 for LIRE

There's a bug where barnybug/elasticsearch:1.0.3 installs Elasticsearch 1.1.1
and not 1.0.3 as expected.

    $ docker run -d --name=es3 crccheck/elasticsearch
