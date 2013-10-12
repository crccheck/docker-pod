
## Dockerfile recipes

Add `universe` to `sources.list`:
```
RUN echo "deb http://archive.ubuntu.com/ubuntu precise universe" >> /etc/apt/sources.list
```
