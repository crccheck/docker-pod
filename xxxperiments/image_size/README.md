Dockerfile Tests
================

Optimizing Image Size
---------------------

There's a baseline Dockerfile that installs some packages. And then many
variations that install the package and then try to clean up in various ways.
You'll have to examine each Dockerfile to see for yourself, but here are my
results (keep in mind the base ubuntu box is 225.4 MB, lines images in
alphabetical order):

```
REPOSITORY                   TAG                 IMAGE ID            CREATED             VIRTUAL SIZE
test/baseline                latest              7b590dec9b43        7 hours ago         272.6 MB
test/baseline_lines          latest              e165025980f7        9 minutes ago       272.6 MB
test/baseline_lists          latest              b40f9e108a93        About an hour ago   272.6 MB
test/combo                   latest              744b502e0052        2 seconds ago       269.8 MB
test/combo2                  latest              be8f1c1de02e        About an hour ago   249.8 MB
test/combo3                  latest              da948e2838d9        About an hour ago   249.8 MB
test/install                 latest              e7cadcbb5a05        12 hours ago        269.8 MB
test/install_clean           latest              dd1383285e85        12 hours ago        269.8 MB
test/install_lists           latest              e55f6f8ebac8        12 hours ago        269.8 MB
test/purge                   latest              ef8c2aa7400b        About an hour ago   273.5 MB
test/remove                  latest              75e3e5c4e246        About an hour ago   273.5 MB
```

As you can see, the only thing that makes a difference is cramming everything
into one checkpoint. And that's expected. What I did not expect was that adding
extra steps did not increase the virtual size. I expected some overhead to
accumlate with extra steps.

### Running it yourself

You can read the makefile to see what happens, but to just run the test, run:

    make test
