# Веб экзамен

## Клонируйте проект себе на компьютер
```sh
git clone https://github.com/MaxWarAxe/web-exam.git
```

## Для запуска проекта потребуются
 
```sh
Установить npm 
```

```sh
Установить и запустить docker 
```
## Запуск фронтенда

### Переход в директорию

```sh
cd front
```
### Установка зависимостей

```sh
npm install
```

### Запуск

```sh
npm run dev
```
## Запуск бэкенда

### Перейдите в директорию wslprojectphp
```sh
cd wslprojectphp
```
### Запустите все контейнеры

```sh
make up
```
### Используйте файл dataBaseBackup3.sql для восстановления базы данных

#### 1) Зайдите в pgAdmin4
#### 2) Подключитесь к серверу СУБД по следующим параметрам
```
Host name / username : localhost
Port: 5433
Username: postgres
Password: postgres
```
#### 3) Создайте базу данных с названием mydatabase (если она создана удалите её принудительно)
#### 4) Правой кнопкой по mydatabase -> Query Tool 
#### 5) Исполните SQL который находится в файле dataBaseBackup3.sql в корне проекта

### Доп параметры для работы изображений
```sh
make php-shell
```
```sh
cd ..
```

```sh
chown -R www-data:www-data html
```


~~### Запустите миграцию~~

```sh
make php-shell
```
```sh
php bin/console make:migration 
```
затем
```sh
php bin/console cache:clear
```~~
