JUPYTER_TOKEN ?= changeme

.DEFAULT_GOAL := help

.PHONY: help up down restart build rebuild logs shell url ps clean

help: ## Show this help message
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "  \033[36m%-12s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

up: ## Start the Jupyter server in the background
	JUPYTER_TOKEN=$(JUPYTER_TOKEN) docker compose up -d

down: ## Stop the Jupyter server
	docker compose down

restart: down up ## Restart the Jupyter server (down + up)

build: ## Build the Docker image
	docker compose build

rebuild: ## Rebuild the image from scratch (no cache) and start it
	docker compose build --no-cache
	JUPYTER_TOKEN=$(JUPYTER_TOKEN) docker compose up -d

logs: ## Follow the Jupyter server logs
	docker compose logs -f jupyter

shell: ## Open a bash shell inside the running container
	docker compose exec jupyter bash

url: ## Print the JupyterLab URL with the access token
	@echo "http://localhost:8888/lab?token=$(JUPYTER_TOKEN)"

ps: ## Show container status
	docker compose ps

clean: ## Stop containers, remove the built image and any volumes
	docker compose down --rmi local --volumes
