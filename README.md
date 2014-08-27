# My Dockerfile Pod

Written for Docker v0.6-v1.2. I try to take advantage of [external volumes].
Like Docker, these are only suitable for local development and are very much
WIP. DISCLAIMER: These should not be thought of as the right way to do things.
I'm just messing around trying to get things to work. For images that have
their own repo, the repo's README will have more detail.

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

tor

https://github.com/crccheck/docker-tor


## Open Refine 2.6 beta 1

### Usage Examples

Starting the container:

    docker run --name="refine" -P openrefine

Find out which port to connect to:

    docker ps

Starting the container at the default address: http://localhost:3333

    docker run --name="refine" -p 3333:3333 openrefine

### Links

* Homepage: http://openrefine.org/index.html
* FAQ: https://github.com/OpenRefine/OpenRefine/wiki/FAQ
* Wiki: https://github.com/OpenRefine/OpenRefine/wiki

## Varnish

Installs Varnish Web Accelerator v3.0.2-1. Runs on port 80.

## Postgresql 9.3 and PostGIS 2.1

A Postgresql 9.3 + Postgis 2.1 image that supports external volumes.
https://github.com/crccheck/docker-postgis

## Minecraft 1.7.4

### Usage

Run (has to be on port 25565):

    docker run -d -p 25565:25565 -name="craft" minecraft

References:

* https://github.com/overshard/docker-minecraft/blob/master/Dockerfile
* https://github.com/spikegrobstein/docker-minecraft-server/blob/master/Dockerfile
* http://minecraft.gamepedia.com/Tutorials/Setting_up_a_server
* http://www.minecraftforum.net/topic/420-tutorial-on-running-minecraft-on-a-dedicated-server/

## Redis

Installs Redis Server v2.2.12, runs on port 6379

