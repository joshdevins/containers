NAME = joshdevins/data-science

all: build test

.PHONY: build
build:
	docker build --tag=$(NAME) .

.PHONY: test
test:
	docker run $(NAME) ./bin/test.sh
	docker tag --force=true $(NAME) $(NAME):latest

.PHONY: clean
clean:
	echo "Nothing to clean!"
