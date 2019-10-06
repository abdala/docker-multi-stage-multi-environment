FROM docker:dind

RUN apk --no-cache --update add python py-urllib3 py-pip python-dev libffi-dev openssl-dev gcc libc-dev make curl bash vim python3 zip \
 && pip install --upgrade requests awscli docker-compose \
 && pip3 install scar \
 && adduser -DH scar

COPY docker /
