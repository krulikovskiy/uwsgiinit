#!/bin/bash

# Запускать под ROOT
# $1 - название проекта


mkdir -p /var/www/$1
mkdir /var/www/$1/assets
mkdir /var/www/$1/media

cat nginx.conf | sed 's/project_name/'$1'/' > /etc/nginx/sites-available/$1.conf
ln -s /etc/nginx/sites-available/$1.conf /etc/nginx/sites-enabled/$1.conf

cat uwsgi.ini | sed 's/project_name/'$1'/' > /etc/uwsgi/sites/$1.ini

cd /var/www/$1
python3.6 -m venv virt
source virt/bin/activate
pip install django
