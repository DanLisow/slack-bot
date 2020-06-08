<%--
  Created by IntelliJ IDEA.
  User: austi
  Date: 18.05.2020
  Time: 16:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/side-block.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin-modal.css">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/logo.svg">
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
            integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
            crossorigin="anonymous"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <title>СКБ-ЛАБ</title>

    <script type="text/javascript">
        $(document).ready(function(){
            $('.employee-block .edit').on('click', function(){
               let id = $(this).parent().find('#id').val();
               $.ajax({
                   type: 'GET',
                   url: '${pageContext.request.contextPath}/api/specialist/find/' + id,
                   success: function (specialist) {
                       $('#edit-specialist #id').val(specialist.id);
                       $('#edit-specialist #name').val(specialist.name);
                       $('#edit-specialist #surname').val(specialist.surname);
                       $('#edit-specialist #slack').val(specialist.slack);
                   }
               });
            });
        });
    </script>

</head>

<body>

<!-- ========= БЛОК ВСЕЯ РУСИ =========== -->
<div class="admin-container">

    <!-- Боковая панель -->
    <div class="left__side-block">
        <div class="nav-side">
            <a href="#" class="nav-side__link"><img src="${pageContext.request.contextPath}/resources/img/logo.svg" alt=""></a>
            <a href="#" class="nav-side__link active"><img src="${pageContext.request.contextPath}/resources/img/user.svg" alt=""></a>
            <a href="#" class="nav-side__link" data-toggle="modal" data-target="#add-specialist"
               style="opacity: 1;"><img src="${pageContext.request.contextPath}/resources/img/add-user.svg" alt=""></a>
        </div>
    </div>

    <!-- Модальное окно - Добавить сотрудника -->
    <div class="modal fade" id="add-specialist" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <span class="add">Добавить нового сотрудника</span>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="${pageContext.request.contextPath}/specialist/create" method="post">
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
                            <input type="text" name="slack" placeholder="Slack-id сотрудника" required>
                        </div>
                        <div class="role">
                            <span>Роль</span>
                            <div class="role-buttons">
                                <input type="button" value="HR-специалист" class="button-active" />
                                <input type="button" value="Модератор" />
                            </div>
                        </div>
                        <button type="submit" class="save">
                            <span>Сохранить</span>
                            <img src="${pageContext.request.contextPath}/resources/img/arrow-white.svg" alt="">
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Модальное окно - Редактировать сотрудника -->
    <div class="modal fade" id="edit-specialist" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <span class="add">Редактировать карточку сотрудника</span>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="${pageContext.request.contextPath}/specialist/update" method="post">
                        <div class="surname">
                            <span>Фамилия</span>
                            <input type="text" id="surname" name="surname" placeholder="Введите фамилию сотрудника" required>
                        </div>
                        <div class="name">
                            <span>Имя</span>
                            <input type="text" id="name" name="name" placeholder="Введите имя сотрудника" required>
                        </div>
                        <div class="slack">
                            <span>Slack-id</span>
                            <input type="text" id="slack" name="slack" placeholder="Slack-id сотрудника" required>
                        </div>
                        <div class="role">
                            <span>Роль</span>
                            <div class="role-buttons">
                                <input type="button" value="HR-специалист" class="button-active" />
                                <input type="button" value="Модератор" />
                            </div>
                        </div>
                        <button type="submit" class="save">
                            <span>Сохранить</span>
                            <img src="${pageContext.request.contextPath}/resources/img/arrow-white.svg" alt="">
                        </button>
                        <input type="hidden" id="id" name="id">
                    </form>
                </div>
            </div>
        </div>
    </div>


    <!-- ================БЛОК, ВХОДЯЩИЙ В ПЕРВУЮ ИКОНКУ БОКОВОГО МЕНЮ================= -->
    <div class="admin-block" id="admin-block__first">

        <!-- Блок с менюшкой -->
        <nav class="admin-block__menu">
            <div class="admin-block__menu-tabs">
                <ul class="nav nav-tabs">
                    <li class="nav-item active"><a href="#admin-information" data-toggle="tab"
                                                   class="nav-link active">HR-специалисты</a></li>
                </ul>
            </div>
            <div class="admin-block__menu-account">
                <a href="#" class="menu-account__bell"><img src="${pageContext.request.contextPath}/resources/img/bell.svg" alt="" srcset=""></a>
                <span>Антон Глухов</span>
                <a href="#" class="menu-account__avatar"><img src="${pageContext.request.contextPath}/resources/img/account.svg" alt="" srcset=""></a>
                <a href="#" class="menu-account__exit"><img src="${pageContext.request.contextPath}/resources/img/exit.svg" alt=""></a>
            </div>
        </nav>

        <!-- =========== Основной Контент ============== -->

        <!-- ======================== HR-специалисты ======================== -->
        <!-- Блок с табличкой и сортировкой -->
        <div class="admin-information">

            <!-- Чисто сортировка -->
            <div class="admin-information__nav">
                <div class="admin-information__nav-sort">
                    Сортировать: <span>По Фамилии Имени (А-я)</span>
                    <a href="#"><img src="${pageContext.request.contextPath}/resources/img/arrow.svg" alt=""></a>
                </div>
                <div class="admin-information__nav-search">
                    <input type="text" placeholder="Введите ФИО и дату начала...">
                </div>
            </div>

            <!-- Таблица с сотрудниками -->
            <div class="admin-information__employees">

                <!-- Заголовки таблицы -->
                <div class="admin-information__employees-table">
                    <span>Сотрудник</span>
                    <span>Роль</span>
                    <span></span>
                </div>

                <div class="employee-role">

                    <c:forEach var="spec" items="${specialist}" varStatus="i">
                        <!-- Сам сотрудник -->
                        <div class="employee-block">
                            <div class="employee">
                                <img src="${pageContext.request.contextPath}/resources/img/avatar.svg" alt="">
                                <span class="employee-name"><a href="#">${spec.surname} ${spec.name}</a></span>
                            </div>
                            <span>HR-специалист</span>
                            <div class="employee-edit">
                                <a href="#" class="edit" data-toggle="modal" data-target="#edit-specialist" ><img src="${pageContext.request.contextPath}/resources/img/pencil.svg" alt=""></a>
                                <a href="${pageContext.request.contextPath}/specialist/${spec.id}" class="delete"><img src="${pageContext.request.contextPath}/resources/img/bin.svg" alt=""></a>
                                <input type="hidden" id="id" value="${spec.id}">
                            </div>
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



    </div>



</div>























<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
        integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
        crossorigin="anonymous"></script>
<script src="js/admin.js"></script>
</body>

</html>