<g:set var="firstname" value="${session.getAttribute("firstname")}"></g:set>
<g:set var="lastname" value="${session.getAttribute("lastname")}"></g:set>
<g:set var="username" value="${session.getAttribute("username")}"></g:set>
<g:set var="email" value="${session.getAttribute("email")}"></g:set>
<g:set var="photo" value="${session.getAttribute("photo")}"></g:set>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <head>
        <asset:stylesheet src="custom.css"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
              integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
              crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
                integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
                crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
                integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
                crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
                integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
                crossorigin="anonymous"></script>
        <script src="https://use.fontawesome.com/a81c0d9f01.js"></script>
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.css">

        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Flamenco&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
        <asset:stylesheet src="custom.css"/>
        <asset:stylesheet src="userListCustom.css.css"/>
        <title>UserList</title>
    </head>
    <title>Users</title>
</head>

<body>
<h1>UserLists</h1>
<nav class="navbar navbar-expand-sm bg-light rounded mynav" style="margin: 10px 80px 35px 80px;">
    <ul class="navbar-nav">
        <li class="nav-item">
            <a class="nav-link" href="#"><u class="ls">Link Sharing</u></a>
        </li>
        <li class="nav-item">
            <g:if test="${photo}">
                <a href=${createLink(controller: "profile",action: "userProfile")}>
                    <img style="margin-top:5px;width: 40px;height: 40px;margin-left: 800px" ;
                         src="data:image/jpg;base64,${photo}"/></a>
            </g:if>
            <g:else>
                <a href = ${createLink(controller:"profile",action:"userProfile")}><asset:image src="xyz.jpg" alt="Myphoto" height="40px" width="40px"
                                                                                                style="margin: 0px 0px 0px 790px;"/></a>
            </g:else>
        </li>
        <li class="nav-item">
            <div class="dropdown" style="margin: 5px 5px 0px 5px;">
                <button class="btn btn-light dropdown-toggle" type="button" data-toggle="dropdown">${session.getAttribute("firstname")}
                    <span class="caret"></span></button>
                <ul class="dropdown-menu">
                    <li><a href="${createLink(controller: "profile",action: "index")}">Profile</a></li>
                    <li><a href="${createLink(controller: "user",action: "dashboard")}">Dashboard</a></li>
                    <li><a href="${createLink(controller: "logout")}">Logout</a></li>
                </ul>
            </div>
        </li>
    </ul>
</nav>

<div class="container">
    <div class="row" style="padding: 10px">
        <table id="dtBasicExample" class="table table-striped table-bordered table-sm" cellspacing="0" width="100%" style="margin: 10px">
            <thead>
            <tr>
                <th class="th-sm">Id
                </th>
                <th class="th-sm">UserName
                </th>
                <th class="th-sm">Email
                </th>
                <th class="th-sm">FirstName
                </th>
                <th class="th-sm">LastName
                </th>
                <th class="th-sm">Active Status
                </th>
            </tr>
            </thead>
            <tbody>
            <g:each in="${list}" var="u">
                <tr>
                    <td style="padding: 15px">${u.id}</td>
                    <td style="padding: 15px">${u.username}</td>
                    <td style="padding: 15px">${u.email}</td>
                    <td style="padding: 15px">${u.firstName}</td>
                    <td style="padding: 15px">${u.lastName}</td>
                    <td style="padding: 15px">
                        <g:if test="${u.active}"><g:link controller="user" action="changeActiveStatus" params="[userId:u.id]">Yes</g:link></g:if><g:if test="${!u.active}"><g:link controller="user" action="changeActiveStatus" params="[userId:u.id]">No</g:link></g:if></td>
                </tr>
            </g:each>
            </tbody>
        </table>
    </div>
</div>
<script>
    $(document).ready(function () {
        $('#dtBasicExample').DataTable();
        $('.dataTables_length').addClass('bs-select');
    });
</script>
</body>
</html>

