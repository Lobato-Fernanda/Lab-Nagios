#!/bin/bash

echo "Atualizando sistema..."

sudo apt update -y
sudo apt upgrade -y

echo "Instalando dependências..."

sudo apt install -y apache2 php gcc make wget unzip \
libapache2-mod-php libgd-dev

echo "Criando usuário nagios..."

sudo useradd nagios
sudo groupadd nagcmd

sudo usermod -a -G nagcmd nagios
sudo usermod -a -G nagcmd www-data

echo "Baixando Nagios Core..."

cd /tmp

wget https://assets.nagios.com/downloads/nagioscore/releases/nagios-4.4.14.tar.gz

tar -xzf nagios-4.4.14.tar.gz

cd nagios-4.4.14

echo "Compilando Nagios..."

./configure --with-command-group=nagcmd

make all

sudo make install
sudo make install-init
sudo make install-config
sudo make install-commandmode

echo "Configurando Apache..."

sudo make install-webconf

sudo a2enmod rewrite
sudo a2enmod cgi

echo "Criando usuário web do Nagios..."

sudo htpasswd -c /usr/local/nagios/etc/htpasswd.users nagiosadmin

echo "Reiniciando Apache..."

sudo systemctl restart apache2

echo "Iniciando Nagios..."

sudo systemctl start nagios

echo "Instalação concluída!"
