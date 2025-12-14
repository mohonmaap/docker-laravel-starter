FROM php:8.2-fpm

# Install dependency OS & PHP extension yang dibutuhkan Laravel
RUN apt-get update && apt-get install -y \
    git \
    curl \
    zip \
    unzip \
    libpng-dev \
    && docker-php-ext-install pdo_mysql \
    && rm -rf /var/lib/apt/lists/*

# Install Composer dari image resmi
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Set working directory Laravel
WORKDIR /var/www/html
