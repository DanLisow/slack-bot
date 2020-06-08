<%--
  Created by IntelliJ IDEA.
  User: austi
  Date: 19.05.2020
  Time: 12:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/user.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/side-block.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/modal.css">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/logo.svg">
    <title>СКБ-ЛАБ</title>
</head>

<body>

<!-- ========= БЛОК ВСЕЯ РУСИ =========== -->
<div class="main-user">

    <!-- Боковая панель -->
    <div class="left__side-block">
        <div class="nav-side">
            <a href="#" class="nav-side__link"><img src="${pageContext.request.contextPath}/resources/img/logo.svg" alt=""></a>
            <a href="#" class="nav-side__link active"><img src="${pageContext.request.contextPath}/resources/img/user.svg" alt=""></a>
            <a href="/question" class="nav-side__link"><img src="${pageContext.request.contextPath}/resources/img/question.svg" alt=""></a>
            <a href="#" class="nav-side__link" data-toggle="modal" data-target="#add-employee"
               style="opacity: 1;"><img src="${pageContext.request.contextPath}/resources/img/add-user.svg" alt=""></a>
        </div>
    </div>

    <div class="modal modal-employee fade" id="add-employee" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <span class="add">Добавить нового сотрудника</span>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="${pageContext.request.contextPath}/employee/create" method="post">
                        <div class="surname">
                            <span>Фамилия</span>
                            <input type="text" name="surname" placeholder="Введите фамилию сотрудника" required>
                        </div>
                        <div class="name">
                            <span>Имя</span>
                            <input type="text" name="name" placeholder="Введите имя сотрудника" required>
                        </div>
                        <div class="slack">
                            <span>Slack-id</span>
                            <input type="text" name="slackId" placeholder="Slack-id сотрудника" required>
                        </div>
                        <button type="submit">
                            <span>Добавить сотрудника</span>
                            <img src="${pageContext.request.contextPath}/resources/img/arrow-white.svg" alt="">
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- ================ БЛОК С ЮЗЕРОМ ================= -->
    <div class="main-user__block">

        <c:forEach var="empl" items="${employee}">

        <!-- Блок с менюшкой -->
        <nav class="main-user__menu">
            <div class="main-user__menu-back">
                <a href="${pageContext.request.contextPath}/employee">
                    <img src="${pageContext.request.contextPath}/resources/img/arrow.svg" alt="">
                    <span>Вернуться к списку пользователей</span>
                </a>
            </div>
            <div class="main-block__menu-account">
                <a href="#" class="menu-account__bell"><img src="${pageContext.request.contextPath}/resources/img/bell.svg" alt="" srcset=""></a>
                <span>Антон Глухов</span>
                <a href="#" class="menu-account__avatar"><img src="${pageContext.request.contextPath}/resources/img/account.svg" alt="" srcset=""></a>
                <a href="/" class="menu-account__exit"><img src="${pageContext.request.contextPath}/resources/img/exit.svg" alt=""></a>
            </div>
        </nav>

        <!-- Информация о юзере -->
        <div class="main-user__inform">

            <div class="main-user__inform-avatar">
                <img src="${pageContext.request.contextPath}/resources/img/avatar.svg" alt="">
                <span>${empl.surname} ${empl.name}</span>
            </div>

            <div class="personal-info">
                <div class="personal-info__block">
                    <span>Slack-id</span>
                    <span>${empl.slackId}</span>
                </div>
                <div class="personal-info__block">
                    <span>Начало работы</span>
                    <span><fmt:formatDate value="${empl.timeOfEntering}" pattern="dd.MM.yyyy" /></span>
                </div>
                <c:if test="${empl.timeOfEnding != null}">
                    <div class="personal-info__block">
                        <span>Окончил анкетирование</span>
                        <span><fmt:formatDate value="${empl.timeOfEnding}" pattern="dd.MM.yyyy" /></span>
                    </div>
                </c:if>
            </div>
        </div>

        <!-- Табы юзерские -->
        <div class="main-user__tabs">
            <ul class="nav nav-tabs">
                <li class="nav-item">
                    <a href="#answer" data-toggle="tab" class="nav-link active">Отвеченные вопросы</a>
                </li>
                <li class="nav-item">
                    <a href="#unanswered" data-toggle="tab" class="nav-link">Неотвеченные вопросы</a>
                </li>
                <li class="nav-item">
                    <a href="#plane" data-toggle="tab" class="nav-link">Запланированные</a>
                </li>
            </ul>
        </div>

        <!-- =========== Основной Контент ============== -->
        <div class="tab-content">

            <!-- 1111111 Блок с отвеченными вопросами -->
            <div class="main-user__information tab-pane show fade active" id="answer">

                <!-- Таблица с вопросами -->
                <div class="main-user__question">

                    <!-- Заголовки таблицы -->
                    <div class="main-user__question-table">
                        <span>Дата ответа</span>
                        <span>Вопрос</span>
                    </div>

                    <div class="user-wrapper">


                        <c:forEach var="ques" items="${question}">
                            <!-- Сам вопрос -->
                            <div class="user-question__block active">
                                <div class="question-date">
                                    <span>07.06.2020</span>
                                </div>
                                <div class="accordeon-text accordion" data-accordion="open">
                                    <div class="accordion-header">
                                        <div class="answer-text">${ques.text}</div>
                                        <button class="btn btn-link" data-toggle="collapse" data-target="#collapseOne"
                                                aria-expanded="false" aria-controls="collapseOne">
                                            <img src="${pageContext.request.contextPath}/resources/img/arrow.svg" alt="">
                                        </button>
                                    </div>

                                    <div class="accordion-body">
                                        <div class="accordion-body__name">
                                            <span>${empl.surname} ${empl.name}:</span>
                                            <span>22:30</span>
                                        </div>
                                        <div class="accordion-body__question">
                                            Не очень комфортно работать при такой высокой температуре, жалко, что нет кондиционера. Моя новая команда не сразу ввела меня в курс дела, пришлось долго разбираться с кодом другого разработчика, так как разработчик ушёл куда-то и не оставил документации. Очень непривычно работать с одним монитором, в прошлом офисе разработчикам предоставляли два и более при необходимости
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </c:forEach>


                    </div>

                </div>
            </div>
            </c:forEach>

            <!-- 2222222 Блок с неотвеченными вопросами -->
            <div class="main-user__information tab-pane fade" id="unanswered">

                <!-- Таблица с вопросами -->
                <div class="main-user__question">

                    <!-- Заголовки таблицы -->
                    <div class="main-user__question-table">
                        <span>Дата отправки</span>
                        <span>Вопрос</span>
                        <span></span>
                    </div>

                    <div class="user-wrapper">




                    </div>
                </div>

            </div>


            <!-- 3333333 Блок с запланированными вопросами -->
            <div class="main-user__information tab-pane fade" id="plane">

                <!-- Таблица с вопросами -->
                <div class="main-plane__question">

                    <!-- Заголовки таблицы -->
                    <div class="main-user__question-table">
                        <span>Дата отправки</span>
                        <span>Вопрос</span>
                    </div>

                    <div class="user-wrapper">




                    </div>
                </div>

            </div>

        </div>

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
<script src="${pageContext.request.contextPath}/resources/js/color.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/ajax.js"></script>
</body>

</html>
