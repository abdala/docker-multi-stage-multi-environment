FROM docker:dind

ENV http_proxy=http://172.17.0.1:3128 \
    https_proxy=http://172.17.0.1:3128

RUN apk --no-cache --update add python py-urllib3 py-pip python-dev libffi-dev openssl-dev gcc libc-dev make curl bash vim python3 zip git
RUN pip install --upgrade requests awscli docker-compose
RUN mkdir -p ~/.docker/cli-plugins
RUN curl -L -o ~/.docker/cli-plugins/docker-buildx https://github.com/docker/buildx/releases/download/v0.3.1/buildx-v0.3.1.linux-amd64
RUN chmod +x ~/.docker/cli-plugins/docker-buildx

COPY docker /
