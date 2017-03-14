default: all

all: clean build test

.PHONY: clean
clean:
	make -C data-science clean

.PHONY: build
build:
	make -C data-science build

.PHONY: test
test:
	make -C data-science test
