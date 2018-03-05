FROM php:5.6-apache
RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng-dev \
    && docker-php-ext-install -j$(nproc) iconv mcrypt mysqli \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    && pecl install mcrypt-1.0.1 xdebug-2.5.0 \
    && docker-php-ext-enable xdebug

# PostgreSQL
RUN apt-get update && apt-get install -y libpq-dev \
    && docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
    && docker-php-ext-install pdo pdo_pgsql pgsql

# Install ioncube
ADD https://downloads.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.gz /usr/local/
RUN tar -zxvf /usr/local/ioncube_loaders_lin_x86-64.tar.gz -C /usr/local/ \
    && rm /usr/local/ioncube_loaders_lin_x86-64.tar.gz

# Install SOAP / WSDL
RUN apt-get update && apt-get install -y libxml2-dev \
     && docker-php-ext-install soap

RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf
RUN echo ServerName localhost >> /etc/apache2/conf-enabled/docker-php.conf

# Install PHP-Settings
COPY php.ini /usr/local/etc/php/

