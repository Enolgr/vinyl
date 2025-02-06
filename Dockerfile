# Usar la imagen oficial de PHP con Apache
FROM php:apache

# Instalar las extensiones de PHP para MySQL (MySQLi y PDO MySQL)
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Copiar los archivos de tu proyecto al directorio de Apache
COPY . /var/www/html/

# Exponer el puerto 80 para el servidor web
EXPOSE 80
