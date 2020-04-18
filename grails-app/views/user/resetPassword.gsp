
<%@ page contentType="text/html;charset=UTF-8" %><html>
<head>
    <title>
        Reset Password
    </title>
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
            integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
            integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
            crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
            integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
            crossorigin="anonymous"></script>
    <script src="https://use.fontawesome.com/a81c0d9f01.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
    <asset:stylesheet src="custom.css"/>
    <asset:javascript src="homePage.js"/></head>
<body>

<h1>Reset Password</h1>

<div class="panel animated shake" id="passMessage">
    <div class="panel-body bg-info text-center">
        <label id="messg"></label>
    </div>
</div>

<nav class="navbar navbar-expand-sm bg-light rounded mynav">
    <ul class="navbar-nav">
        <li class="nav-item">
            <a class="nav-link" href="#"><u class="ls">Link Sharing</u></a>
        </li>
        <li class="nav-item">
            <g:if test="${user.photo}">
                <a href=${createLink(controller: "profile",action: "userProfile")}>
                    <img style="margin-top:5px;width: 40px;height: 40px;margin-left: 800px" ;
                         src="data:image/jpg;base64,${user.photo}"/></a>
            </g:if>
            <g:else>
                <a href = ${createLink(controller:"profile",action:"userProfile")}><asset:image src="xyz.jpg" alt="Myphoto" height="40px" width="40px"
                                                                                                style="margin: 0px 0px 0px 790px;"/></a>
            </g:else>
        </li>
    </ul>
</nav>

<div class="center" style="margin: auto;padding: 10px;width: 38%;border: 3px solid black;background-color: #f1f1f1">
    <div class="row">
        <label for="txtPassword" name="password" class="col-sm-5 col-form-label">Password</label>
        <div class="col-sm-7">
            <input type="password" id="txtPassword" placeholder="Password" name="password"
                   class="form-control bg-white rounded" required>
        </div>
    </div><br>
    <div class="row">
        <label for="txtConfirmPassword" name="confirmPassword" class="col-sm-5 col-form-label">Confirm Password</label>
        <div class="col-sm-7">
            <input type="password" id="txtConfirmPassword" placeholder="Confirm Password"
                   name="confirmPassword" class="form-control bg-white rounded"
                   required>
        </div>
    </div><br>
    <div class="row">
        <div class="registrationFormAlert" id="message" style="width: 109px;text-align: center"></div>
        <div class="alert-danger forgot" style="width: 184px;text-align: center" hidden></div>
    </div>
    <div class="password" hidden>${params.userId}</div>
    <button type="submit" class="btn-primary reset" style="width: 150px;position:relative;left: 157px">RESET</button>
</div>
</body>
</html>

