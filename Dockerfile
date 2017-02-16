FROM php:7.1-fpm
RUN apt-get update && apt-get install -y nginx wget git zip unzip vim && rm -rf /var/lib/apt/lists/*
RUN wget https://raw.githubusercontent.com/composer/getcomposer.org/1b137f8bf6db3e79a38a5bc45324414a6b1f9df2/web/installer -O - -q | php -- --quiet \
 && mv composer.phar /usr/local/bin/composer && composer global require "hirak/prestissimo:^0.3" && docker-php-ext-install pdo_mysql
ADD infra/laravel.conf /etc/nginx/conf.d/default.conf 
ADD infra/nginx.conf /etc/nginx/nginx.conf
EXPOSE 80