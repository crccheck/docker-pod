README.md:
	cp intro.md README.md
	find -name Dockerfile -exec grep ^$$ {} --max-count=1 --before-context=999 \; | cut -c3- >> README.md


remotes:
	git remote add postgis git@github.com:crccheck/docker-postgis.git
	git fetch --all

push_postgis:
	git subtree push --prefix=postgis postgis master

.PHONY: README.md
