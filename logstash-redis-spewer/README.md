Logstash Redis Spewer
=====================

This is a Docker image that creates a Redis server with a list that fills
continuously with events.

This list is designed to be used as an input into a Logstash configuration to
simulate a Logstash -> Redis -> Logstash setup.

Usage
-----

#### Environment Variables

* `LIST_NAME=<>`: The name of the Redis list (default: `logstash`)
* `MAX_COUNT`: The maximum number of events this list should grow to (default:
  infinity)
* `DATE_FROM`: The timestamp to begin filling dates from
