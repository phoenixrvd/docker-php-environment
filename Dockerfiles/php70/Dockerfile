FROM php:7.0-apache

# Install Linux-Deps.
RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng-dev \
        libpq-dev \
        libxml2-dev

# Install PHP-Extensions
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
    && docker-php-ext-install -j$(nproc) gd pdo pdo_pgsql pgsql iconv \
        mcrypt mysqli pdo_mysql soap zip \
    && pecl install xdebug-2.5.0 \
    && docker-php-ext-enable xdebug

# Install ioncube
ADD https://downloads.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.gz /usr/local/
RUN tar -zxvf /usr/local/ioncube_loaders_lin_x86-64.tar.gz -C /usr/local/ \
    && rm /usr/local/ioncube_loaders_lin_x86-64.tar.gz

RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf
RUN echo ServerName localhost >> /etc/apache2/conf-enabled/docker-php.conf
RUN a2enmod rewrite

# Install PHP-Settings
COPY php.ini /usr/local/etc/php/
RUN chmod 777 /tmp