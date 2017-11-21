FROM library/php:fpm-alpine

RUN docker-php-ext-install mysqli \
	&& docker-php-ext-install pdo \
	&& docker-php-ext-install pdo_mysql \
	&& docker-php-ext-install tokenizer \
	&& docker-php-ext-install xml \
	&& docker-php-ext-install openssl \
	&& docker-php-ext-install pcntl \
	&& pecl install xdebug \
    && docker-php-ext-enable xdebug \
	&& docker-php-ext-install mbstring