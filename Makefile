.PHONY: help init up down

help:
	@echo "Available targets: init, up, down"

init:
	@echo "Bootstrapping repository (installing minimal deps)..."
	@echo "See backend/README.md and frontend/README.md for framework setup steps."

up:
	docker-compose up --build

down:
	docker-compose down -v
