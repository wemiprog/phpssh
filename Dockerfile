FROM php:apache

ARG DEBIAN_FRONTEND=noninteractive
RUN cat /etc/apt/sources.list
RUN apt update
RUN apt install -y libssh2-1 libssh2-1-dev zlib1g-dev libicu-dev g++
RUN apt install -y curl libcurl4-openssl-dev

RUN pecl install ssh2-beta
RUN docker-php-ext-install mysqli bcmath intl curl pdo_mysql
RUN docker-php-ext-enable ssh2

RUN apt install -y mariadb-client pngquant unzip zip libpng-dev curl libssl-dev
RUN docker-php-ext-install mysqli bcmath gd intl xml curl pdo_mysql pdo_sqlite hash zip dom session opcache

RUN a2enmod rewrite
