Graphite
========

Graphite is a popular open source graphing library for numeric time series.
Most people use it for server monitoring. This is based off [smartprocedure]'s
fix for [evarga]'s graphite Docker image.

Differences [smartprocedure]'s Docker image:

* Better support for external volumes for persistence
* More logs are exposed as volumes

  [evarga]: https://registry.hub.docker.com/u/evarga/graphite/
  [smartprocedure]: https://registry.hub.docker.com/u/smartprocure/graphite

This image is only for local development only. Although you can provide a lot
of your own configuration, many other configuration options, notably the Django
SECRET_KEY, are unchanged.

Auth
----

Default login info is root/root and can be changed in the Django admin.


Example Graphite Lifecycle
--------------------------

Based on the names and examples establied in the makefile:

* The name of the container is `graphite`
* External volumes are stored in in `$HOME/volumes/graphite`

### Get the default configuration and database

You'll need the `conf` and `storage` directory from the image. You can edit
these configuration files and reuse them between containers.

```bash
docker run --rm --name tmp-graphite crccheck/graphite \
  tar -c --directory /opt/graphite conf storage | \
  tar -xv --directory $HOME/volumes/graphite
```

### Make a container

The only thing special is all the volumes. Because the image has so many ports,
I don't bind them to localhost and just connect directly to the container.

```bash
mkdir -p $HOME/volumes/log/apache2
mkdir -p $HOME/volumes/log/supervisor
docker run -d --name graphite \
  -v $HOME/volumes/conf:/opt/graphite/conf \
  -v $HOME/volumes/log/apache2:/var/log/apache2 \
  -v $HOME/volumes/log/supervisor:/var/log/supervisor \
  -v $HOME/volumes/storage:/opt/graphite/storage \
  crccheck/graphite
```

### Connect

Get the IP of your Graphite container:

```bash
docker inspect --format '{{.NetworkSettings.IPAddress}}' graphite
```

And connect to it with your web browser.
