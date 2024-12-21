ifneq (,$(wildcard ./.env))
    include .env
    export
endif

UID=$(shell id -u)
GID=$(shell id -g)
DOCKER_COMPOSE = env VIRTUAL_HOST=${VIRTUAL_HOST} UID=${UID} GID=${GID} docker compose

run:
	$(DOCKER_COMPOSE) up -d

stop:
	$(DOCKER_COMPOSE) down

shell:
	$(DOCKER_COMPOSE) run --rm app bash

logs:
	$(DOCKER_COMPOSE) logs -f homeassistant

.PHONY: run stop shell
