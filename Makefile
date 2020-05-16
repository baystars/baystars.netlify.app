MAKEFLAGS += --warn-undefined-variables
SHELL := /bin/bash
.SHELLFLAGS := -eu -o pipefail -c
.DEFAULT_GOAL := run

# all targets are phony
.PHONY: $(shell egrep -o ^[a-zA-Z_-]+: $(MAKEFILE_LIST) | sed 's/://')

BUILD_DIR=docs
STATIC_DIR=static

# .env
ifneq ("$(wildcard ./.env)","")
  include ./.env
endif

run: ## Run server
	python manage.py runserver '0.0.0.0:8000'

shell: ## Start shell
	python manage.py shell

createsuperuser: ## Create superuser
	python manage.py createsuperuser

collectstatic: ## Collect static file
	python manage.py collectstatic --noinput

migration: ## Make migration
	python manage.py makemigrations
	python manage.py migrate

build:
	mkdir -p ${BUILD_DIR} ${STATIC_DIR}
	python manage.py collectstatic --noinput
	python manage.py distill-local --force ${BUILD_DIR}

clean:
	rm -rf ${BUILD_DIR} ${STATIC_DIR}

publish: clean build

test:
	python manage.py test

test-v2:
	python manage.py test --verbosity=2

test-v3:
	python manage.py test --verbosity=3

pip: ## Install librasy by pip
	pip install -r requirements.txt

help: ## Print this help
	@echo 'Usage: make [target]'
	@echo ''
	@echo 'Targets:'
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z0-9_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)
