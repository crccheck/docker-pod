#!/usr/bin/env bash
#
# Helper for me to see how slightly different syntaxes affect image sizes

# Create an image for every Dockerfile.* named for the text after the .
for dockerfile in Dockerfile.*; do
    name=${dockerfile##*.}
    echo "Processing $dockerfile -> test/$name"
    tar --transform='s/\..*//' -c --to-stdout $dockerfile | \
      docker build -t "test/$name" --quiet=true -
done

# Report on the images sizes
docker images | grep test/
