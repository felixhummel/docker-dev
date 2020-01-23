.PHONY: run
run:
	docker-compose build
	docker-compose up -d
	docker-compose exec app hostname
	docker-compose down
