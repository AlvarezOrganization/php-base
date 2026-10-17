# syntax=docker/dockerfile:1

# Base de PHP de los proyectos Laravel del equipo: PHP-FPM, nginx, supervisor y las
# extensiones ya compiladas. Compilarlas en cada deploy le llevaba ~6 minutos de los
# 2 CPU al servidor; acá se compilan en GitHub Actions.
ARG PHP_VERSION=8.4

FROM php:${PHP_VERSION}-fpm-alpine

RUN apk add --no-cache \
    nginx \
    supervisor \
    icu-dev \
    libzip-dev \
    oniguruma-dev \
    freetype-dev \
    libjpeg-turbo-dev \
    libpng-dev \
    libwebp-dev \
    libsodium-dev \
    linux-headers \
    mysql-client

RUN docker-php-ext-configure gd --with-freetype --with-jpeg --with-webp \
    && docker-php-ext-install -j"$(nproc)" \
        pdo_mysql \
        bcmath \
        pcntl \
        opcache \
        zip \
        intl \
        gd \
        sodium
