#!/bin/bash

# Запускать под ROOT
# $1 - название проекта

rm -r /var/www/$1
rm /etc/nginx/sites-available/$1
rm /etc/uwsgi/sites/$1.ini
service uwsgi restart
service nginx restart
