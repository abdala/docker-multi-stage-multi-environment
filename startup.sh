docker build . -t talk

docker stop talk; docker rm talk;

docker run -it --privileged \
    --name talk \
    -v $(pwd)/var/lib/docker:/var/lib/docker \
    -v $(pwd)/docker/root:/root \
    -v $(pwd)/src:/src \
    -w /src \
    -d \
    talk

docker exec -it talk bash
