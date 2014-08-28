Postgresql 9.3 + PostGIS 2.1
============================

Features:
* Lets you use an external volume for data and logs
* en_US.UTF-8 locale
* Includes postgresql-client packages so you can use this image to make utility
  containers

Login with `docker` and no password.


Example PostGIS Lifecycle
-------------------------

Based of the names and examples established in the makefile and using
[postdoc] on a Linux box.

  [postdoc]: https://github.com/crccheck/postdoc

### Start a PostGIS server

    docker run --detach --name postgis -v ~/volumes/postgis:/data -p 5432:5432 crccheck/postgis
    export DATABASE_URL=postgis://docker@127.0.0.1:5432/states

### Creating a database, "states"

Locally:

    # "states" and connection args were set above in DATABASE_URL
    phd createdb

Using this image as a utility container:

    docker run --rm --name postgis-debug --link postgis:postgis -i -t \
      crccheck/postgis \
      createdb -U docker -h postgis -p 5432 states

### Connect to the database using `psql`

Locally:

    # "states" and connection args were set above in DATABASE_URL
    phd psql

Using this image as a utility container:

    docker run --rm --name postgis-debug --link postgis:postgis -i -t \
      crccheck/postgis \
      psql -U docker -h postgis -p 5432

### Viewing logs

There are two and a half ways to view logs:

1. Tail the logfile locally using the external volume:

        $ tail -f ~/volumes/postgis/logs/postgresql.log

2. Tail the logfile in a utility container using the volume:

        $ docker run --rm --name postgis-debug --volumes-from postgis -i -t \
          ubuntu tail -f /data/logs/postgresql.log

3. Attach to the running container (I don't think this currently works):

        docker attach --sig-proxy=false postgis

### Temporarily stopping the container

You may want to stop the image to free up resources:

    docker stop postgis

### Restarting

You can restart the container after you stopped it (or after a reboot):

    docker start postgis

### Dumping the data to your local filesystem

Using pg_dump locally:

    phd pd_dump -Fc > states.dump

And using a helper container:

    docker run --rm --name postgis-debug --link postgis:postgis -i -t \
      crccheck/postgis \
      pg_dump -U docker -h postgis -p 5432 -Fc states

### Removing the container

    docker rm postgis

### Removing the image

    docker rmi crccheck/postgis


## References
* Basic installation: http://www.ubuntuupdates.org/ppa/postgresql
* Original inspiration: https://github.com/orchardup/docker-postgresql/blob/master/Dockerfile
* Locale: https://github.com/x110dc/docker-postgres/blob/master/Dockerfile
* Structure of data/logs: https://registry.hub.docker.com/u/dockerfile/elasticsearch/
* Using external volumes for performance: http://www.davidmkerr.com/2014/06/postgresql-performance-on-docker.html

----

See my master repo at https://github.com/crccheck/docker-pod for more
information.
