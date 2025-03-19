postgres:
	docker run --name yessentemir -p 5433:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -d postgres:15-alpine

createdb:
	docker exec -it yessentemir createdb --username=root --owner=root yessentemir

.PHONY: postgres createdb
