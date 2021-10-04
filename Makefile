build:
	docker-compose build

up:
	docker-compose up

down:
	docker-compose down --volumes

database:
	docker run -e POSTGRES_PASSWORD=postgres -e POSTGRES_DB=api_dev -p 5432:5432 -d postgres:13
