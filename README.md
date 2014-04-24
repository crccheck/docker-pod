# My Dockerfile Pod

Written for Docker v0.6. I try to take advantage of [external volumes]. Like
Docker, these are only suitable for local development and are very much WIP.
DISCLAIMER: These should not be thought of as the right way to do things. I'm
just messing around trying to get things to work.

  [external volumes]: http://blog.docker.io/2013/07/docker-0-5-0-external-volumes-advanced-networking-self-hosted-registry/#external_volumes]


## How To Use These Recipes

These images are not on the [Index][docker index]. Mostly because I think these
`Dockerfile`s suck but also because the Docker index is currently a dumping
ground. You can build images yourself by following these instructions:

1. **Install Docker.** I strongly suggest following these [instructions] to avoid
   having to type `sudo docker`.
2. **Download this repo.** The simplest way is to use this one:
   `git clone https://github.com/crccheck/docker-pod.git && cd docker-pod`, but
   forking and contributing is encouraged!
3. **Build an image.** For example: `docker build -t mysql mysql/` builds
   `mysql/Dockerfile` and tags the image as `mysql`. You can see your images
   with: `docker images`.
4. **Use the image.** Each image has instructions on how to use it. They all
   sorta look like this: `docker run mysql`.

  [docker index]: https://index.docker.io/
  [instructions]: http://docs.docker.io/en/latest/use/basics/#why-sudo


## Have fun!

                                       ##         .
                                 ## ## ##        ==
                              ## ## ## ## ##    ===
                           /""""""""""""""""\___/ ===
                      ~~~ {~~ ~~~~ ~~~ ~~~~ ~~ ~ /  ===- ~~~
                           \______ o          _,/
                            \      \       _,'
                             `'--.._\..--''

  [whale]:  https://gist.github.com/dhrp/5733652


----
# Dockerfile Documentation

## Google Refine 2.5

### Usage Examples

Starting the container:

    docker run --name="refine" -P openrefine

Find out which port to connect to:

    docker ps

### Links

* Homepage: http://openrefine.org/index.html
* FAQ: https://github.com/OpenRefine/OpenRefine/wiki/FAQ
* Wiki: https://github.com/OpenRefine/OpenRefine/wiki

## Elasticsearch

Starts an Elasticsearch 0.90.5 container running on port 9200

References:

* Example Dockerfile http://dahernan.github.io/2013/08/04/docker-to-run-elasticsearch/
* Simpler Java https://gist.github.com/wingdspur/2026107

## Minecraft 1.7.4

### Usage

Run (has to be on port 25565):

    docker run -d -p 25565:25565 -name="craft" minecraft

References:

* https://github.com/overshard/docker-minecraft/blob/master/Dockerfile
* https://github.com/spikegrobstein/docker-minecraft-server/blob/master/Dockerfile
* http://minecraft.gamepedia.com/Tutorials/Setting_up_a_server
* http://www.minecraftforum.net/topic/420-tutorial-on-running-minecraft-on-a-dedicated-server/

## Postgresql 9.3 + Postgis 2.1 + friends

A Postgresql 9.3 + Postgis 2.1 image with hstore, plv8, and more!

### Example Usage

Start container for the first time:

    docker run -d -P -name="pgplus" postgis

Tail the log:

    docker attach pgplus

Stop

    docker stop pgplus

Start it again

   docker start pgplus

References:
* http://docs.docker.io/en/latest/examples/postgresql_service/
* https://github.com/orchardup/docker-postgresql/blob/master/Dockerfile
* http://www.ubuntuupdates.org/ppa/postgresql

## Redis

Installs Redis Server v2.2.12, runs on port 6379

## Varnish

Installs Varnish Web Accelerator v3.0.2-1. Runs on port 80.

## `mysql-server`

A mysql image (version 5.5 at the time of writing) that supports external
volumes. The login is `docker` with no password. Runs on port 3306.

### Example Usage

Run in background on port 3306 storing files in `~/volumes/mysql`:

    docker run -d -v ~/volumes/mysql:/mnt/mysql/ mysql

Fix fubar'd permissions in the remote volume:

    docker run -v ~/volumes/mysql:/mnt/mysql/ mysql sh fix-permissions.sh

References:
* https://github.com/kstaken/dockerfile-examples/tree/master/mysql-server
* https://github.com/paulczar/docker-mysql/blob/master/Dockerfile
* http://dischord.org/blog/2013/08/13/docker-and-owncloud-part-2/

## Postgresql 9.2 and Postgis 2.0

A Postgresql 9.2 + Postgis 2.0 image that supports external volumes. Runs on
port 5432.

### Example Usage

    docker run -d -v ~/volumes/postgres/:/mnt/postgres/ postgis

References:
* https://github.com/orchardup/docker-postgresql/blob/master/Dockerfile
* http://www.ubuntuupdates.org/ppa/postgresql

