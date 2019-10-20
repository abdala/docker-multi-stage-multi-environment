current_dir = $(shell pwd)

all: build remove run exec

build:
	DOCKER_BUILDKIT=1 docker build . -t talk

remove:
	-docker stop talk
	-docker rm talk

run:
	docker run -it --privileged \
		--name talk \
		-v $(current_dir)/var/lib/docker:/var/lib/docker \
		-v $(current_dir)/docker/root:/root \
		-v $(current_dir)/src:/src \
		-w /src \
		-d \
		talk

exec:
	docker exec -it talk bash
