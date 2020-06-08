<%--
  Created by IntelliJ IDEA.
  User: austi
  Date: 19.05.2020
  Time: 23:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/enter.css">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/logo.svg">
    <title>СКБ-ЛАБ</title>
</head>

<body>

<div class="enter-container">
    <div class="enter-menu">
        <div class="enter-menu__logo">
            <div class="enter-menu__logo-img">
                <span>SKB</span>
                <img src="${pageContext.request.contextPath}/resources/img/logo.svg" alt="">
                <span>LAB</span>
            </div>
            <div class="enter-menu__logo-inscription">
                <span>Система управления HR-ботом</span>
            </div>
        </div>
        <div class="enter-menu__designed">
            <span>Designed by</span>
            <a href="https://dribbble.com/double_dribbble"><img src="${pageContext.request.contextPath}/resources/img/Doubledesign.svg" alt=""></a>
        </div>
    </div>
    <div class="enter-auth">
        <span class="enter">Вход в систему</span>
        <form action="/employee" method="get">
            <div class="login">
                <span>Логин</span>
                <input type="text" placeholder="Введите логин" required>
            </div>
            <div class="password">
                <span>Пароль</span>
                <input type="password" placeholder="Введите пароль" required>
            </div>
            <button type="submit">
                <span>Войти в систему</span>
                <img src="${pageContext.request.contextPath}/resources/img/arrow-white.svg" alt="">
            </button>
        </form>
    </div>
</div>




<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
        integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
        crossorigin="anonymous"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
        integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
        crossorigin="anonymous"></script>
</body>

</html>