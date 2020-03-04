.PHONY: dev

start:
	docker-compose up -d hugo

stop:
	docker-compose stop hugo

restart: stop start

# vim: noexpandtab
