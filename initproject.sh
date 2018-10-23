#!/bin/bash

# Запускать под ROOT
# $1 - название проекта


mkdir -p /var/www/$1
mkdir /var/www/$1/assets && chmod 777 -R /var/www/$1/assets
mkdir /var/www/$1/media && chmod 777 -R /var/www/$1/media

cat nginx.conf | sed 's/project_name/'$1'/' > /etc/nginx/sites-available/$1
ln -s /etc/nginx/sites-available/$1 /etc/nginx/sites-enabled/$1

cat uwsgi.ini | sed 's/project_name/'$1'/' > /etc/uwsgi/sites/$1.ini

cd /var/www/$1
python3.6 -m venv virt
source virt/bin/activate
pip install django
django-admin startproject $1
cd $1
service uwsgi restart
service nginx restart
