FROM docker:dind

RUN apk --update add python py-urllib3 py-pip python-dev libffi-dev openssl-dev gcc libc-dev make curl bash vim python3 zip \
 && pip install awscli docker-compose \
 && pip3 install scar
 && adduser scar

COPY docker /
