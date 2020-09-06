FROM php:7.4-fpm-alpine

ADD ./laravel /var/www/laravel

WORKDIR /var/www/laravel

RUN docker-php-ext-install pdo_mysql

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer update

ADD ./setup.sh /setup.sh
RUN chmod +x /setup.sh
CMD ["/setup.sh"]%     
