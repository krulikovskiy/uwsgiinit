# Если до этого не был запущен скрипт то запускаем файл init.sh
```
bash init.sh my_first_project
```
# Если был уже запущен, то запускаем файл project.sh
```
bash project.sh my_last_project
```
# Вставить после BASE_DIR
```
ROOT_DIR = os.path.dirname(BASE_DIR)
PROJECT_ROOT = os.path.dirname(os.path.abspath(__file__))
```
# Вставить вместо STATIC_URL = '/statuc/'
```
MEDIA_ROOT = os.path.join(ROOT_DIR, 'media')
MEDIA_URL = '/media/'
  
STATIC_ROOT = os.path.join(ROOT_DIR, 'assets')
STATIC_URL = '/assets/'
  
STATICFILES_DIRS = (
    os.path.join(BASE_DIR, 'static'),
)
```
