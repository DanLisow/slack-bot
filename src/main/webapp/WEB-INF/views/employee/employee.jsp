<%@ page import="javax.swing.*" %>
<%@ page import="com.fasterxml.jackson.databind.deser.DataFormatReaders" %>
<%@ page import="java.time.format.DateTimeFormatter" %><%--
  Created by IntelliJ IDEA.
  User: austi
  Date: 18.05.2020
  Time: 21:32
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/side-block.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/modal.css">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/logo.svg">
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
            integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
            crossorigin="anonymous"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <title>СКБ-ЛАБ</title>
</head>

<body>

<script type="text/javascript">
    $(window).on('load',function(){
        let body = $('.main-container');
        body.style.opacity = '0.5';
    });
</script>

<img class="down" src="${pageContext.request.contextPath}/resources/img/72.gif"
     style="display: none; position: absolute; width: 100px; height: 100px; left: 50%; top: 50%;" alt="">

<!-- ========= БЛОК ВСЕЯ РУСИ =========== -->
<div class="main-container">

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

    <!-- Модальное окно - Добавить сотрудника -->
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
                        <input type="hidden" name="id">
                        <button type="submit">
                            <span>Добавить сотрудника</span>
                            <img src="${pageContext.request.contextPath}/resources/img/arrow-white.svg" alt="">
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- ================БЛОК, ВХОДЯЩИЙ В ПЕРВУЮ ИКОНКУ БОКОВОГО МЕНЮ================= -->
    <div class="main-block" id="main-block__first">


        <!-- Блок с менюшкой -->
        <nav class="main-block__menu">
            <div class="main-block__menu-tabs">
                <ul class="tabs">
                    <li class=""><a href="#main-information" class="link active">Новые сотрудники</a></li>
                    <li class=""><a href="#anketa" class="link">Прошедшие
                        анкетирование</a></li>
                </ul>
            </div>
            <div class="main-block__menu-account">
                <a href="#" class="menu-account__bell"><img src="${pageContext.request.contextPath}/resources/img/bell.svg" alt="" srcset=""></a>
                <span>Антон Глухов</span>
                <a href="#" class="menu-account__avatar"><img src="${pageContext.request.contextPath}/resources/img/account.svg" alt="" srcset=""></a>
                <a href="/" class="menu-account__exit"><img src="${pageContext.request.contextPath}/resources/img/exit.svg" alt=""></a>
            </div>
        </nav>

        <!-- =========== Основной Контент ============== -->
        <div class="content">

            <!-- ======================== Новые сотрудники ======================== -->
            <!-- Блок с табличкой и сортировкой -->
            <div class="main-information tab faded in active" id="main-information">

                <!-- Чисто сортировка -->
                <div class="main-information__nav">
                    <div class="main-information__nav-sort">
                        Сортировать: <span>По Фамилии Имени (А-я)</span>
                        <a href="#"><img src="${pageContext.request.contextPath}/resources/img/arrow.svg" alt=""></a>
                    </div>
                    <div class="main-information__nav-search">
                        <input type="text" placeholder="Введите ФИО и дату начала...">
                    </div>
                </div>

                <!-- Таблица с сотрудниками -->
                <div class="main-information__employees">

                    <!-- Заголовки таблицы -->
                    <div class="main-information__employees-table">
                        <span>Сотрудник</span>
                        <span>Начало работы</span>
                        <span>Прогресс анкетирования</span>
                        <span></span>
                    </div>

                    <div class="employee-wrapper">

                        <c:forEach var="empl" items="${employee}">
                            <!-- Сам сотрудник -->
                            <div class="employee-block">
                                <div class="employee">
                                    <img src="${pageContext.request.contextPath}/resources/img/avatar.svg" alt="">
                                    <span class="employee-name"><a href="/employee/${empl.id}">${empl.surname} ${empl.name}</a></span>
                                </div>
                                <span><fmt:formatDate value="${empl.timeOfEntering}" pattern="dd.MM.yyyy" /></span>
                                <div class="employee-progress">
                                    <span>0%</span>
                                    <progress value="0" max="100"> </progress>
                                </div>
                                <button class="employee-more">
                                    <span>Подробнее</span>
                                    <img src="${pageContext.request.contextPath}/resources/img/more.svg" alt="">
                                </button>

                            </div>

                        </c:forEach>


                    </div>

                    <div class="pagination">
                        <div class="pagination-list">
                            <img src="${pageContext.request.contextPath}/resources/img/arrow.svg" alt="">
                            <span class="pagination-active">1</span>
                            <span>2</span>
                            <span>3</span>
                            <span>4</span>
                            <span>...</span>
                            <span>99</span>
                            <img src="${pageContext.request.contextPath}/resources/img/arrow.svg" alt="">
                        </div>
                    </div>

                </div>
            </div>

            <!-- ======================== Прошедшие анкетирование ==================== -->
            <div class="main-information tab faded " id="anketa">
                <div class="main-information__nav">
                    <div class="main-information__nav-sort">
                        Сортировать: <span>По Фамилии Имени (А-я)</span>
                        <a href="#"><img src="${pageContext.request.contextPath}/resources/img/arrow.svg" alt=""></a>
                    </div>
                    <div class="main-information__nav-search">
                        <input type="text" placeholder="Введите ФИО и дату начала...">
                    </div>
                </div>

                <!-- Таблица с сотрудниками -->
                <div class="main-information__employees">

                    <!-- Заголовки таблицы -->
                    <div class="main-information__employees-table">
                        <span>Сотрудник</span>
                        <span>Начало работы</span>
                        <span>Прогресс анкетирования</span>
                        <span></span>
                    </div>

                    <div class="employee-wrapper">


                        <c:forEach var="empl" items="${employee}">
                            <c:if test="${empl.timeOfEnding != null}">
                                <!-- Сам сотрудник -->
                                <div class="employee-block employee-active">
                                    <div class="employee">
                                        <img src="${pageContext.request.contextPath}/resources/img/avatar.svg" alt="">
                                        <span class="employee-name"><a href="/employee/${empl.id}">${empl.surname} ${empl.name}</a></span>
                                    </div>
                                    <span><fmt:formatDate value="${empl.timeOfEntering}" pattern="dd.MM.yyyy" /></span>
                                    <div class="employee-result">
                                        <span><fmt:formatDate value="${empl.timeOfEnding}" pattern="dd.MM.yyyy" /></span>
                                    </div>
                                    <button class="employee-more">
                                        <span>Подробнее</span>
                                        <img src="${pageContext.request.contextPath}/resources/img/more.svg" alt="">
                                    </button>
                                </div>
                            </c:if>
                        </c:forEach>


                    </div>

                    <div class="pagination">
                        <div class="pagination-list">
                            <img src="${pageContext.request.contextPath}/resources/img/arrow.svg" alt="">
                            <span class="pagination-active">1</span>
                            <span>2</span>
                            <span>3</span>
                            <span>4</span>
                            <span>...</span>
                            <span>99</span>
                            <img src="${pageContext.request.contextPath}/resources/img/arrow.svg" alt="">
                        </div>
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
<script src="${pageContext.request.contextPath}/resources/js/move.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/tabs.js"></script>
</body>

</html>