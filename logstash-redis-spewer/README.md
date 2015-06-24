Logstash Redis Spewer
=====================

This is a Docker image that creates a Redis server with a list that fills
continuously with events.

This list is designed to be used as an input into a Logstash configuration to
simulate a Logstash -> Redis -> Logstash setup.

Usage
-----

#### Environment Variables

* `LIST_NAME=<string>`: The name of the Redis list (default: `logstash`)
* `DOC_TYPE=<string>: The document type to give the messages (default: `spew`)
* `MAX_COUNT`=<int>: The maximum number of events this list should grow to. Due
  to race conditions, the number is only approximate. (default: infinity)
* _TODO_ `DATE_FROM`=<??>: The timestamp to begin filling dates from

#### Starting the built in ELK stack

```
make elk
```

#### Checking out

/_count?q=_type:spew

/_search?q=_type:spew
