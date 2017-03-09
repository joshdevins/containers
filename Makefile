.PHONY: clean
clean:
	make -C data-science clean

.PHONY: build
build:
	make -C data-science build

.PHONYL test
test:
	make -C data-science test
