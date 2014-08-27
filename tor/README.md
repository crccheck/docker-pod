# tor

Based on hsaito's docker-torbox, but I ended up needing to make significant
modifications. Usage style inspired by the official elasticsearch Dockerfile.

## Example Usages:

Run tor just as a socks proxy in the background:

    docker run --name tor-socks -p 9050:9050 -d crccheck/tor

View the logs on `tor-socks` (use Ctrl-p Ctrl-q to detach):

    docker attach tor-socks

Run a custom configuration file:

    # your own torrc file in ~/volumes/tor-relay/torrc
    docker run --name tor-relay --net=host \
      -v $HOME/volumes/tor-relay:/var/lib/tor crccheck/tor \
      tor -f /var/lib/tor/torrc

Generate a tor hashed password:

    docker run --rm crccheck/tor tor --quiet --hash-password hunter2

References:

* https://github.com/hsaito/docker-torbox
* https://registry.hub.docker.com/u/dockerfile/elasticsearch/dockerfile/
* https://www.torproject.org/docs/tor-manual.html.en
