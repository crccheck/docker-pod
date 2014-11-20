ZZ
==

This is a basic Ubuntu box I have configured with some utilities I commonly
want but aren't in the base Ubuntu image.

Extras:

* ab
* curl
* telnet
* wget


Usage
-----

### As a CoreOS toolbox

You can use this image as your [CoreOS toolbox](https://coreos.com/docs/cluster-management/debugging/install-debugging-tools/):

```bash
# set toolboxrc
echo "TOOLBOX_DOCKER_IMAGE=crccheck/zz" > ~/.toolboxrc

# start toolbox
toolbox
```

or by adding this to your `user-data`:

```yaml
write_files:
  - path: /home/core/.toolboxrc
    owner: core:core
    permissions: 0644
    content: |
      TOOLBOX_DOCKER_IMAGE=crccheck/zz
```

You can then access the parent filesystem at `/media/root`.


Why `zz`?
---------

1. It's very fast to type.
2. It's very rare. I've never seen anyone else use `zz`.
3. It shows up last alphabetically.


----
[pod](https://github.com/crccheck/docker-pod)
