FROM php:7.1-apache

ADD content/webserver /

# Get repository and install wget and vim
RUN apt-get update && apt-get install --no-install-recommends -y \
        wget \
        gnupg \
        git \
        unzip

RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli
RUN apt-get update && apt-get upgrade -y

RUN a2enmod rewrite \ 
    && apt-get update \ 
    && apt-get install -y curl mariadb-client libpng-dev libxml2-dev man openssh-server wget vim git zip unzip \
    && docker-php-ext-install soap pdo pdo_mysql gd \
    && pecl install xdebug-2.5.0 && docker-php-ext-enable xdebug

RUN a2ensite hosts \ 
    && service apache2 restart

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- \
        --install-dir=/usr/local/bin \
        --filename=composer