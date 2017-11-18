FROM library/php:fpm-alpine

RUN docker-php-ext-install mysqli \
	&& docker-php-ext-install pdo \
	&& docker-php-ext-install pdo_mysql \
	&& docker-php-ext-install mcrypt \
	&& docker-php-ext-install gd \
	&& docker-php-ext-install xsl \
	&& docker-php-ext-install pcntl \
	&& pecl install imagick \
    && docker-php-ext-enable imagick \
	&& pecl install xdebug \
    && docker-php-ext-enable xdebug \
	&& docker-php-ext-install mbstring \
	&& docker-php-ext-install calendar