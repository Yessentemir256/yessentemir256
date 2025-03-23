postgres:
	docker run --name yessentemir -p 5433:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -d postgres:15-alpine

createdb:
	docker exec -it yessentemir createdb --username=root --owner=root yessentemir

dropdb:
	docker exec -it yessentemir dropdb yessentemir

migrateup:
	migrate -path db/migration -database "postgresql://root:secret@localhost:5433/yessentemir?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration -database "postgresql://root:secret@localhost:5433/yessentemir?sslmode=disable" -verbose down

sqlc:
	sqlc generate

.PHONY: postgres createdb dropdb migrateup migratedown sqlc
