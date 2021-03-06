FROM php:7.0-apache

# Install PHP Core extensions
#RUN apt-get update && apt-get install -y \
#        libfreetype6-dev \
#        libjpeg62-turbo-dev \
#        libmcrypt-dev \
#        libpng12-dev \
#    && docker-php-ext-install -j$(nproc) iconv mcrypt \
#    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
#    && docker-php-ext-install -j$(nproc) gd

# Install PHP PECL extensions
#RUN apt-get update && apt-get install -y libmemcached-dev \
#    && pecl install memcached \
#    && docker-php-ext-enable memcached

# Install other PHP extensions (example)
#RUN curl -fsSL 'https://xcache.lighttpd.net/pub/Releases/3.2.0/xcache-3.2.0.tar.gz' -o xcache.tar.gz \
#    && mkdir -p xcache \
#    && tar -xf xcache.tar.gz -C xcache --strip-components=1 \
#    && rm xcache.tar.gz \
#    && ( \
#        cd xcache \
#        && phpize \
#        && ./configure --enable-xcache \
#        && make -j$(nproc) \
#        && make install \
#    ) \
#    && rm -r xcache \
#    && docker-php-ext-enable xcache

COPY config/php.ini /usr/local/etc/php/
COPY src/ /var/www/html/
