FROM php:apache
 
# Instalar extensiones necesarias
RUN docker-php-ext-install mysqli pdo pdo_mysql
 
# Copiar archivos del backend
COPY . /var/www/html/
 
# Establecer permisos adecuados
RUN chown -R www-data:www-data /var/www/html
 
# Exponer el puerto 80
EXPOSE 80