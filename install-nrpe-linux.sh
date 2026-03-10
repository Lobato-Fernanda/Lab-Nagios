#!/bin/bash

echo "Instalando NRPE..."

sudo apt update

sudo apt install -y nagios-nrpe-server nagios-plugins

echo "Editando configuração..."

sudo nano /etc/nagios/nrpe.cfg

echo "Adicione o IP do servidor Nagios na linha allowed_hosts"

echo "Reiniciando NRPE..."

sudo systemctl restart nagios-nrpe-server

echo "Agente configurado."
