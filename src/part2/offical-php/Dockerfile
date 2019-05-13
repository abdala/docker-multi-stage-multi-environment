#----------------- base -------------------------

FROM php:7.2-apache as base

RUN docker-php-ext-install pdo_mysql

#------------- dependencies ---------------------

FROM base as dependencies

WORKDIR /app 

COPY . /app

RUN apt-get update \
 && apt-get install -y unzip \
 && curl -sS https://getcomposer.org/installer | \
    php -- --install-dir=/usr/bin/ --filename=composer \
 && composer install --no-dev --no-interaction 

#----------------- cli -------------------------

FROM dependencies as cli

RUN composer install --no-interaction

#----------------- app -------------------------

FROM base as app

COPY --from=dependencies /app /app

COPY docker /

RUN docker-php-ext-install opcache \
 && a2enmod rewrite \
 && chown -R www-data:www-data /app/storage /app/bootstrap/cache
