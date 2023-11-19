FROM php:8.1-fpm    

# ララベルプロジェクトの追加
ADD ./laravel /var/www/laravel
WORKDIR /var/www/laravel

# 必要な拡張機能のインストール
RUN docker-php-ext-install pdo_mysql

# 必要なツールのインストール
RUN apt-get update && \
    apt-get install -y git unzip && \
    apt-get install -y libzip-dev && \
    docker-php-ext-install zip
# Composerのインストール
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Composer依存関係の更新
RUN composer update

# セットアップスクリプトの追加
ADD ./setup.sh /setup.sh
RUN chmod +x /setup.sh
CMD ["/setup.sh"]