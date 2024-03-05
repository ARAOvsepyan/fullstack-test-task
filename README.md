# Fullstack Dashboard

<div align="center">

![JavaScript](https://img.shields.io/badge/javascript-%23323330.svg?style=for-the-badge&logo=javascript&logoColor=%23F7DF1E)
![NodeJS](https://img.shields.io/badge/node.js-6DA55F?style=for-the-badge&logo=node.js&logoColor=white)
![Postgres](https://img.shields.io/badge/postgres-%23316192.svg?style=for-the-badge&logo=postgresql&logoColor=white)
![Express.js](https://img.shields.io/badge/express.js-%23404d59.svg?style=for-the-badge&logo=express&logoColor=%2361DAFB)
![React](https://img.shields.io/badge/react-%2320232a.svg?style=for-the-badge&logo=react&logoColor=%2361DAFB)
![MUI](https://img.shields.io/badge/MUI-%230081CB.svg?style=for-the-badge&logo=mui&logoColor=white)

</div>

## ВОЗМОЖНОСТИ

ФЛЬТРАЦИЯ

[![SUzJW.gif](https://s9.gifyu.com/images/SUzJW.gif)](https://gifyu.com/image/SUzJW)

СОЗДАНИЕ СТУДЕНТА И ЕГО ДИПЛОМНОЙ РАБОТЫ

[![SUzJ4.gif](https://s9.gifyu.com/images/SUzJ4.gif)](https://gifyu.com/image/SUzJ4)

ОБНОВЛЕНИЕ И УДАЛЕННЫЕ ДАННЫХ

[![SUzJ9.gif](https://s9.gifyu.com/images/SUzJ9.gif)](https://gifyu.com/image/SUzJ9)

## BACKEND

### Файловая структура

```
server
 ┣ controllers (Контроллеры)
 ┃ ┣ professorController.js
 ┃ ┣ studentContoller.js
 ┃ ┗ thesisController.js
 ┣ dtos (Шаблоны)
 ┃ ┣ personEntity.js
 ┃ ┣ professorDto.js
 ┃ ┣ studentDto.js
 ┃ ┗ thesisDto.js
 ┣ error (Обработчик ошибок)
 ┃ ┗ apiError.js
 ┣ middleware (Промежуточные обработчки)
 ┃ ┣ createPersonMiddleware.js
 ┃ ┗ errorMiddleware.js
 ┣ models (Модель БД)
 ┃ ┗ models.js
 ┣ router (Роуты)
 ┃ ┣ index.js
 ┃ ┣ professorRouter.js
 ┃ ┣ studentRoute.js
 ┃ ┗ thesisRouter.js
 ┣ .env
 ┣ .prettierignore
 ┣ .prettierrc
 ┣ README.md
 ┣ db.js
 ┣ index.js
 ┣ package-lock.json
 ┗ package.json
```

### Для запуска REST сервера:

1. Скачать все используемые npm пакеты

> \$ npm install

2. Запуск сервера

> \$ npm run dev

3. Сервер запустится по этому адресу [http://localhost:8000](http://localhost:8000).

 
## FRONTEND

## Файловая структура

```
client
 ┣ public
 ┃ ┗ index.html
 ┣ src
 ┃ ┣ api
 ┃ ┃ ┣ index.js
 ┃ ┃ ┗ thesisApi.js
 ┃ ┣ components
 ┃ ┃ ┣ modals
 ┃ ┃ ┃ ┣ AddThesis.jsx
 ┃ ┃ ┃ ┗ UpdateThesisTitle.jsx
 ┃ ┃ ┣ AppRouter.jsx
 ┃ ┃ ┣ Header.jsx
 ┃ ┃ ┣ ProfessorsGrid.jsx
 ┃ ┃ ┗ ThesisGrid.jsx
 ┃ ┣ scenes
 ┃ ┃ ┣ auth
 ┃ ┃ ┃ ┗ index.jsx
 ┃ ┃ ┣ dashboard
 ┃ ┃ ┃ ┗ index.jsx
 ┃ ┃ ┣ global
 ┃ ┃ ┃ ┣ SideBar.jsx
 ┃ ┃ ┃ ┗ TopBar.jsx
 ┃ ┃ ┗ tables
 ┃ ┃ ┃ ┗ index.jsx
 ┃ ┣ App.js
 ┃ ┣ index.css
 ┃ ┣ index.js
 ┃ ┣ routes.js
 ┃ ┗ theme.js
 ┣ .eslintrc.json
 ┣ .gitignore
 ┣ README.md
 ┣ package-lock.json
 ┣ package.json
 ┗ prettier.config.js
```


### Для запуска React приложения:

1. Скачать все используемые npm пакеты

> \$ npm install

2. Запуск приложения

> \$ npm run start

3. Сервер запустится по этому адресу [http://localhost:3000](http://localhost:3000).
