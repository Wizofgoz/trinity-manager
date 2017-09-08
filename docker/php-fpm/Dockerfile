FROM php:7.0-fpm
RUN apt-get update && apt-get install -y \
	libmemcached-dev \
	libz-dev \
	libmcrypt-dev \
	libfreetype6-dev  \
	libjpeg62-turbo-dev  \
	libpng12-dev \
	less \
	net-tools \
	vim \
	libxslt1-dev \
	zip \
	git \
	nodejs \
	npm \
	libdbd-mysql-perl \
	libmagickwand-dev --no-install-recommends \
	&& useradd -m --shell /bin/bash dash \
	&& npm install -g n && n stable \
	&& npm install -g bower \
	&& npm install -g gulp \
	&& docker-php-ext-install mysqli \
	&& docker-php-ext-install pdo \
	&& docker-php-ext-install pdo_mysql \
	&& docker-php-ext-install mcrypt \
	&& docker-php-ext-install gd \
	&& docker-php-ext-install xsl \
	&& docker-php-ext-install pcntl \
	&& pecl install memcached-3.0.3 \
	&& docker-php-ext-enable memcached \
	&& pecl install imagick \
    && docker-php-ext-enable imagick \
	&& pecl install xdebug \
    && docker-php-ext-enable xdebug \
	&& docker-php-ext-install mbstring \
	&& docker-php-ext-install calendar \
  && mkdir -p /var/cache/sit/public \
  && mkdir -p /var/cache/sit/public/schema \
  && mkdir -p /var/cache/sit/public/schema/tables \
  && chown -R www-data:www-data /var/cache/sit \