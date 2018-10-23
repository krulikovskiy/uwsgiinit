#!/bin/bash

# Запускать под ROOT
# $1 - название проекта, при повторном создании проекта запускать файл project.sh, а не init.sh

# Нужные пакеты для установки Python 3.6.7
apt-get -y install xz-utils gcc libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev nginx

# Установка Python 3.6.7
wget https://www.python.org/ftp/python/3.6.7/Python-3.6.7.tar.xz
tar -xpJf Python-3.6.7.tar.xz
cd Python-3.6.7
./configure --enable-optimizations
make altinstall

# Удаление установочных файлов Python
rm -R Python-3.6.7
rm Python-3.6.7.tar.xz

# Создание всех папок сервера
mkdir -p /etc/uwsgi/sites
mkdir /var/log/uwsgi
mkdir /run/uwsgi

# Установка сервера
pip3.6 install uwsgi

# копирование конфига запуска и автозапуск
cp uwsgi.service /etc/systemd/system/
systemctl enable uwsgi

# Создание проекта
bash initproject.sh $1
