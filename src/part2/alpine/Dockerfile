#------------------- base -----------------------

FROM alpine:3.10 as base

RUN apk add --update --no-cache php7-pdo_mysql php7-json php7-tokenizer php7-mbstring php7-iconv \
    php7-bcmath php7-simplexml php7-ctype php7-openssl php7-session

#---------------- dependencies ------------------

FROM base as dependencies

WORKDIR /app

COPY docker /

COPY composer.json /app/
COPY composer.lock /app/

RUN apk add composer unzip \
 && composer install --no-dev --no-interaction --no-autoloader

COPY . /app

#------------------ optimized --------------------

FROM dependencies as optimized

COPY docker /

RUN composer dump-autoload --classmap-authoritative --optimize

#------------------ cli -------------------------

FROM dependencies as cli

RUN apk add php7-dom php7-xml php7-xmlwriter \
 && composer install --no-interaction

#------------------ app -------------------------

FROM base as app

COPY docker /

COPY --from=optimized /app /app

RUN apk add php7-apache2 php7-opcache \
 && chown -R apache:apache /app/storage /app/bootstrap/cache

EXPOSE 80

CMD ["httpd", "-D", "FOREGROUND"]
