#------------------- base -----------------------

FROM alpine:3.9 as base

RUN apk update \
 && apk add php7-pdo_mysql php7-json php7-tokenizer php7-mbstring php7-iconv php7-bcmath php7-simplexml php7-session

#---------------- dependencies ------------------

FROM base as dependencies

WORKDIR /app

COPY . /app

RUN apk add composer unzip \
 && composer install --no-dev --no-interaction

#------------------ cli -------------------------

FROM dependencies as cli

RUN apk add php7-dom php7-xml php7-xmlwriter php7-posix \
 && composer install --no-interaction

#----------------- worker -----------------------

FROM base as worker

RUN apk add php7 supervisor

COPY docker /

COPY --from=dependencies /app /app

CMD supervisord --nodaemon --configuration /etc/supervisor/supervisord.conf

#------------------ node ------------------------

FROM node:10.3-alpine as node

WORKDIR /app

COPY . /app

RUN apk add --update nasm libpng-dev bash make g++ zlib-dev autoconf \ 
 && yarn install --non-interactive --no-progress \
 && yarn production

#------------------ app -------------------------

FROM base as app

COPY docker /

COPY --from=dependencies /app /app

COPY --from=node /app/public /app/public

RUN apk add php7-apache2 php7-opcache \
 && chown -R apache:apache /app/storage /app/bootstrap/cache

EXPOSE 80

CMD httpd -DFOREGROUND
