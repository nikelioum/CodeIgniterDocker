# Use an official PHP image with Apache
FROM php:8.2-apache

# Enable Apache mod_rewrite
RUN a2enmod rewrite

# Install PHP extensions including intl
RUN apt-get update && apt-get install -y \
    libzip-dev unzip git zip libicu-dev \
    && docker-php-ext-install zip mysqli pdo pdo_mysql intl

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Change Apache DocumentRoot to /public
ENV APACHE_DOCUMENT_ROOT=/var/www/html/public

# Apply new DocumentRoot to Apache config
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/000-default.conf

# Set working directory
WORKDIR /var/www/html

# Copy app files
COPY ./app/ /var/www/html/

# Set permissions on all files, especially writable directory
RUN chown -R www-data:www-data /var/www/html && \
    chmod -R 775 /var/www/html/writable

# Allow .htaccess overrides (for mod_rewrite)
RUN sed -i '/<Directory \/var\/www\/>/,/<\/Directory>/ s/AllowOverride None/AllowOverride All/' /etc/apache2/apache2.conf

