README.md:
	cp intro.md README.md
	find -name Dockerfile -exec grep ^$$ {} --max-count=1 --before-context=999 \; | cut -c3- >> README.md


.PHONY: README.md
