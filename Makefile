init: docker-down-clear docker-pull docker-build docker-up node-init backend-init frontend-init
down: docker-down-clear backend-clear frontend-clear
restart: down init

docker-up:
	docker-compose up -d

docker-down:
	docker-compose down --remove-orphans

docker-down-clear:
	docker-compose down -v --remove-orphans

docker-pull:
	docker-compose pull

docker-build:
	docker-compose build

node-init:
	docker-compose run --rm node-cli yarn install

migrate-up:
	docker-compose run --rm node-cli yarn run migrate

backend-init: backend-install backend-ready

backend-install:
	docker-compose run --rm node-cli yarn --cwd backend/ install

backend-ready:
	docker run --rm -v ${PWD}/src/backend:/app -w /app alpine touch .ready

backend-clear:
	docker run --rm -v ${PWD}/src/backend:/app -w /app alpine sh -c 'rm -rf .ready dist'

frontend-init: frontend-install frontend-ready

frontend-install:
	docker-compose run --rm node-cli yarn --cwd frontend/ install

frontend-ready:
	docker run --rm -v ${PWD}/src/frontend:/app -w /app alpine touch .ready

frontend-clear:
	docker run --rm -v ${PWD}/src/frontend:/app -w /app alpine sh -c 'rm -rf .ready build'