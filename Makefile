
all: build remove run exec

build:
	DOCKER_BUILDKIT=1 docker build . -t talk

remove:
	-docker stop talk
	-docker rm talk

run:
	docker run -it --privileged \
		--name talk \
		-v $(pwd)/var/lib/docker:/var/lib/docker \
		-v $(pwd)/docker/root:/root \
		-v $(pwd)/src:/src \
		-w /src \
		-d \
		talk

exec:
	docker exec -it talk bash
