FROM docker:dind

RUN apk --no-cache --update add python py-urllib3 py-pip python-dev libffi-dev openssl-dev gcc libc-dev make curl bash vim python3 zip git \
 && pip install --upgrade requests awscli docker-compose \
 && pip3 install scar \
 && adduser -DH scar
 && DOCKER_BUILDKIT=1 docker build --platform=local -o . git://github.com/docker/buildx \
 && mkdir -p ~/.docker/cli-plugins \
 && mv buildx ~/.docker/cli-plugins/docker-buildx

COPY docker /
