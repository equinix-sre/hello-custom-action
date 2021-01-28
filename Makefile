SHELL := /bin/bash
project_dir := $(shell pwd)
dockerfile_sha := $(shell (sha1sum Dockerfile | awk '{print $$1}'))
root_dir := $(shell echo $(CURDIR) | tr A-Z a-z)
docker_tag := "$(shell basename $(root_dir))-bc:$(dockerfile_sha)"

.DEFAULT_GOAL := run-locally

build-container:
	docker build -t $(docker_tag) .

run-locally:
	docker run --network host -v $(project_dir):/app -w /app -it $(docker_tag) /bin/bash
