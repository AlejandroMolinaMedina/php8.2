FROM php:8.2-fpm-alpine


RUN apk update && apk add --no-cache \
    curl \
    git \
    unzip \
    bash \
    supervisor \
    nginx \
    php-cli \
    php-phar \
    php-openssl \
    php-mbstring \
    php-session \
    php-ctype \
    php-tokenizer \
    php-fileinfo \
    php-curl \
    php-opcache \
    php-dom \
    php-xml \
    php-xmlwriter \
    php-simplexml \
    php-intl \
    php-pdo \
    php-pdo_mysql \
    php-mysqli \
    php-zip \
    libpng-dev \
    freetype-dev \
    libjpeg-turbo-dev \
    bzip2-dev \
    oniguruma-dev \
    icu-dev \
    libzip-dev \
    icu-dev libzip-dev \
    imagemagick \
    imagemagick-dev \
    $PHPIZE_DEPS \
    && echo "" | pecl install imagick \
    && docker-php-ext-enable imagick \
    && apk del $PHPIZE_DEPS \
    && docker-php-ext-install intl zip \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install bcmath gd \
    && docker-php-ext-install pdo_mysql \
    && ln -s /usr/bin/php /usr/bin/php8


# Instalar composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

