NAME = joshdevins/data-science

all: clean build test

.PHONY: clean
clean:
	@echo "Nothing to clean!"

.PHONY: build
build:
	docker build --tag=$(NAME) .

.PHONY: test
test:
	./bin/run.sh ./bin/test.sh
	docker tag $(NAME) $(NAME):latest
