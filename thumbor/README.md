# [Thumbor](https://github.com/thumbor/thumbor) v4.8.7


#### Testing the container

    # start a temporary container
    docker run --rm -p 8888:8888 crccheck/thumbor

    # load an image through thumbor
    http://localhost:8888/unsafe/500x100/thumborize.me/static/img/beach.jpg
