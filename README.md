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
### Используйте файл dataBaseBackup3.sql для восстановления бабзы данных

#### Зайдите в pgAdmin4
#### Подключитесь к серверу по 
```
Host name / username : localhost
Port: 5433
Username: postgres
Password: postgres
```
#### Создайте базу данных с названием mydatabase (если она создана удалите её принудительно)
#### Правой кнопкой по mydatabase -> Query Tool 
#### Исполните SQL который находится в файле dataBaseBackup3.sql в корне проекта

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
