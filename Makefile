SERVICE := gitius
VERSION := $(shell git describe --tags --abbrev=0 | tr -d 'v')
IMAGE   := ashanaakh/$(SERVICE):$(VERSION)

.PHONY: default build push run

default: build run

build:
	@echo '> Building "$(SERVICE)" docker image...'
	@docker build -t $(IMAGE) .

push: build
	@docker push $(IMAGE)

run:
	@echo '> Starting "$(SERVICE)" container...'
	@docker run -it $(IMAGE)


