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
### Запустите миграцию

```sh
make php-shell
```
```sh
php bin/console make:migration 
```
затем
```sh
php bin/console cache:clear
```
