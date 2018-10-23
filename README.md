# Нужные пакеты для установки Python 3.6.7
apt-get -y install xz-utils gcc libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev nginx

# Если до этого не был запущен скрипт то запускаем файл init.sh
bash init.sh my_first_project

# Если был уже запущен, то запускаем файл project.sh
bash project.sh my_last_project

