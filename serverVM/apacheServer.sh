#!/usr/bin/env bash

# Ingresar con privilegios root
sudo -i

# Instalar apache2
sudo apt-get install apache2

# Brindar permisos al directorio www
sudo chmod 0777 www -R

# Establecer propietario
usuario=`whoami`
sed -i 's/${APACHE_RUN_USER}/'"$usuario"'/g' /etc/apache2/apache2.conf
sed -i 's/${APACHE_RUN_GROUP}/'"$usuario"'/g' /etc/apache2/apache2.conf
Systemctl restart apache2

# Configuracion del servidor web
# Crear carpeta contenedor
mkdir /var/www/trabajoSO/

# Crear Index
touch /var/www/pruebaPHP/index.php

# Crear archivo de configuracion para apuntar al index
touch /etc/apache2/sites-available/trabajoSO.conf

# Editar archivo de configuración
cat <<-'trabajoSOconf' > /etc/apache2/sites-available/trabajoSO.conf
<VirtualHost *:80>
        ServerName trabajoSO.com
        ServerAdmin root@trabajoSO.com
        ServerAlias www.trabajoSO.com
        DocumentRoot /var/www/trabajoSO
        DirectoryIndex index.php
</VirtualHost>
trabajoSOconf

# Activar configuración en el servidor
a2ensite trabajoSO.conf
a2dissite 000-default.conf
systemctl reload apache2

# Añadir dominios en archivo hosts
sed -i '3i 10.0.2.15       www.pruebaPHP.es' /etc/hosts
sed -i '4i 10.0.2.15       www.trabajoSO.com' /etc/hosts
