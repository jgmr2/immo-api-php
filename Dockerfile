# Usar una imagen base oficial de PHP con Apache
FROM php:8.1-apache

# Instalar las dependencias de Composer y extensiones necesarias
RUN apt-get update && apt-get install -y \
    libzip-dev \
    libmariadb-dev-compat \
    libmariadb-dev \
    && docker-php-ext-install zip pdo_mysql \
    && docker-php-ext-enable zip pdo_mysql \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Copiar los archivos del proyecto al directorio de trabajo del contenedor
COPY . /var/www/html/

# Instalar las dependencias de Composer
RUN composer install --no-dev --optimize-autoloader

# Exponer el puerto en el que la aplicación se ejecutará
EXPOSE 80
