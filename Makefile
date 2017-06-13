# Creates a base image for emcniece/nginx

NAMESPACE := emcniece
PROJECT := nginx-cache-purge
PLATFORM := linux
ARCH := amd64
DOCKER_IMAGE := $(NAMESPACE)/$(PROJECT)

VERSION := $(shell cat VERSION)
#GITSHA := $(shell git rev-parse --short HEAD)

all: help

help:
	@echo "---"
	@echo "IMAGE: $(DOCKER_IMAGE)"
	@echo "VERSION: $(VERSION)"
	@echo "---"
	@echo "make debian - compile Debian Docker image"
	@echo "make alpine - compile Alpine Docker image"
	@echo "make run-debug - run container with tail"
	@echo "make docker - push to Docker repository"
	@echo "make release - push to latest tag Docker repository"

debian:
	docker build -t $(DOCKER_IMAGE):$(VERSION)-debian \
		-f Dockerfile-debian .

alpine:
	docker build -t $(DOCKER_IMAGE):$(VERSION)-alpine \
		-f Dockerfile-alpine .

run-debian:
	docker run -d $(DOCKER_IMAGE):$(VERSION)-debian

run-alpine:
	docker run -d $(DOCKER_IMAGE):$(VERSION)-alpine

docker:
	@echo "Pushing $(DOCKER_IMAGE):$(VERSION)"
	docker push $(DOCKER_IMAGE):$(VERSION)-debian
	docker push $(DOCKER_IMAGE):$(VERSION)-alpine

release: docker
	@echo "Pushing $(DOCKER_IMAGE):latest"
	docker tag $(DOCKER_IMAGE):$(VERSION)-alpine $(DOCKER_IMAGE):latest
	docker push $(DOCKER_IMAGE):latest

clean:
	docker rmi $(DOCKER_IMAGE):$(VERSION)
	docker rmi $(DOCKER_IMAGE):latest
