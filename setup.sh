#!/bin/sh

cp /var/www/laravel/.env.example /var/www/laravel/.env
chmod +w /var/www/laravel/.env

touch /var/www/laravel/storage/logs/laravel.log
chmod -R 755 /var/www/laravel/storage/
chown -R www-data:www-data /var/www/laravel/storage/

php artisan key:generate
php artisan migrate

php-fpm
