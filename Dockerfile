# Start from the official PHP image that comes with the Apache web server
FROM php:8.3-apache

# Install the mysqli extension (PHP's MySQL driver; it isn't included by default)
RUN docker-php-ext-install mysqli

# Make public/ the website root, so browsers can't reach database/ or debug/
ENV APACHE_DOCUMENT_ROOT=/var/www/html/public
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf \
 && sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

# Copy the project into the image
COPY . /var/www/html/