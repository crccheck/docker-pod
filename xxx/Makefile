test: clean
	./test.sh

# make sure old test images are gone before building new ones
clean:
	-docker rmi $$(docker images | grep test/ | awk '{ print $$3 }') 2> /dev/null
