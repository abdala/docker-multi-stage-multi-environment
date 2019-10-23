
ci: lint build scan test

lint:
	docker-compose run --rm hadolint < Dockerfile

build:
	docker-compose build --pull --parallel

scan:
	docker-compose run --rm trivy --auto-refresh --clear-cache 250478887320.dkr.ecr.us-east-1.amazonaws.com/talk

test:
	docker-compose run --rm cli ./vendor/bin/phpunit --testdox

cli:
	docker-compose run --rm cli sh
