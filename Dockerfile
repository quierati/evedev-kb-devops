FROM php:5.6-fpm

# Install dependencies
RUN apt-get update && apt-get install -y \
	build-essential \
	libssl-dev \
	zlib1g-dev \
	libpng-dev \
	libjpeg-dev \ 
	libfreetype6-dev \
        libjpeg62-turbo-dev \
	vim \
        zip \
        unzip \
        curl \
        sysstat \
        tcpdump \
        strace \
        ca-certificates \ 
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install -j$(nproc) mysqli \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Add user for laravel application
RUN groupadd -g 1000 www
RUN useradd -u 1000 -ms /bin/bash -g www www

# Copy existing application directory permissions
COPY --chown=www:www ./src /var/www/public

# Set working directory
WORKDIR /var/www/public

# Change current user to www
USER www

# Expose port 9000 and start php-fpm server
EXPOSE 9000
CMD ["php-fpm"]
