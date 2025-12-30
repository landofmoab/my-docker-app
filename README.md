# myt-fullstack-app

Monorepo scaffold for a Rails backend + Angular frontend application.

Quick start

- Backend: follow `backend/README.md` to create the Rails app.
- Frontend: follow `frontend/README.md` to create the Angular app.
- Use `docker-compose.yml` and `Makefile` to run services (requires Docker).

More Details Quick Start

Clean and build Docker
- docker-compose down -v  # Remove volumes (fresh DB)
- docker volume prune -f  # Clean old volumes
- docker builder prune -f # Clean build cache
- docker-compose up -d --build  # Full stack
- docker-compose logs backend
- docker ps

Permissions:
- sudo chown -R $(whoami):$(whoami) backend/app/controllers/api/v1/

Frontend Stuff:
- docker-compose exec frontend ng generate component features/profile (this is an example)

Backend Stuff:
- docker-compose exec backend bash -c "bundle exec rails generate controller api/v1/poof-clouds" (this is an example)
OR
- docker-compose exec backend bundle exec rails generate controller api/v1/poof-clouds (this is an example)