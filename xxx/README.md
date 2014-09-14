Dockerfile Tests
================

Optimizing Image Size
---------------------

There's a baseline Dockerfile that installs some packages. And then many
variations that install the package and then try to clean up in various ways.
You'll have to examine each Dockerfile to see for yourself, but here are my
results (keep in mind the base ubuntu box is 225.4 MB):

```
REPOSITORY                   TAG                 IMAGE ID            CREATED              VIRTUAL SIZE
test/remove                  latest              75e3e5c4e246        1 seconds ago        273.5 MB
test/purge                   latest              ef8c2aa7400b        9 seconds ago        273.5 MB
test/combo2                  latest              da948e2838d9        18 seconds ago       249.8 MB
test/combo                   latest              be8f1c1de02e        About a minute ago   249.8 MB
test/baseline_lists          latest              b40f9e108a93        2 minutes ago        272.6 MB
test/baseline                latest              7b590dec9b43        6 hours ago          272.6 MB
test/install_clean           latest              dd1383285e85        10 hours ago         269.8 MB
test/install_lists           latest              e55f6f8ebac8        10 hours ago         269.8 MB
test/install                 latest              e7cadcbb5a05        10 hours ago         269.8 MB
```

As you can see, the only thing that makes a difference is cramming everything
into one checkpoint. And that's expected. What I did not expect was that adding
extra steps did not increase the virtual size. I expected some overhead to
accumlate with extra steps.

### Running it yourself

You can read the makefile to see what happens, but to just run the test, run:

    make test
