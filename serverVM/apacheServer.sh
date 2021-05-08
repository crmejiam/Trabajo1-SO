#!/usr/bin/env bash

# Actualizar el ubuntu
# do-release-upgrade

# Instalar rar para poder extraer el archivo comprimido
sudo apt install unrar

# Instalar netstat
sudo apt install -y net-tools

# Para crear los usuarios necesarios
useradd usuario1
useradd usuario2
useradd usuario3
useradd usuario4
useradd usuario5
printf "passusuario1\npassusuario1" | sudo passwd usuario1
printf "passusuario2\npassusuario2" | sudo passwd usuario2
printf "passusuario3\npassusuario3" | sudo passwd usuario3
printf "passusuario4\npassusuario4" | sudo passwd usuario4
printf "passusuario5\npassusuario5" | sudo passwd usuario5

# Instalar Xampp
if [ $(ls | grep xampp-linux-*-installer-run | wc -l) -e 0 ]; then
wget https://www.apachefriends.org/xampp-files/7.3.28/xampp-linux-x64-7.3.28-0-installer.run
fi
chmod 755 ./xampp-linux-*-installer.run
echo "y y \n y" | sudo ./xampp-linux-*-installer.run

# Añadir pagina web a la carpeta contenedor
cp proyectoSO.rar /opt/lampp/htdocs
unrar x /opt/lampp/htdocs/proyectoSO.rar /opt/lampp/htdocs

# Iniciar Xampp
sudo /opt/lampp/lampp startapache