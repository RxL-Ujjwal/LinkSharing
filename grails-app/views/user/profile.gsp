<g:set var="firstname" value="${session.getAttribute("firstname")}"></g:set>
<g:set var="lastname" value="${session.getAttribute("lastname")}"></g:set>
<g:set var="username" value="${session.getAttribute("username")}"></g:set>
<g:set var="email" value="${session.getAttribute("email")}"></g:set>
<g:set var="photo" value="${session.getAttribute("photo")}"></g:set>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Edit Profile</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <asset:stylesheet href="custom.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <asset:javascript src="myscript.js"/>
</head>

<body>
<h1>Edit Profile</h1>


<g:if test="${flash.message}">
    <div class="panel">
        <div class="panel-body bg-danger text-center">
            ${flash.message}
        </div>
    </div>
</g:if>

<nav class="navbar navbar-expand-sm bg-light rounded mynav">
    <ul class="navbar-nav">
        <li class="nav-item">
            <a class="nav-link" href="#"><u class="ls">Link Sharing</u></a>
        </li>
        <li class="nav-item">
            <img style="width: 40px;height: 40px;margin-left: 770px;margin-top: 5px"
                 src="${createLink(controller: 'user', action: 'fetchUserImage',params:['emailId':email])}"/>

        </li>

        <li class="nav-item">
            <div class="dropdown" style="margin: 5px 5px 0px 5px;">
                <button class="btn btn-light dropdown-toggle" type="button" data-toggle="dropdown">${firstname}
                    <span class="caret"></span></button>
                <ul class="dropdown-menu">
                    <li><a href="${createLink(controller: "logout")}">Logout</a></li>
                </ul>
            </div>

        </li>
    </ul>
</nav>

<div class="row">
    <div class="col-md-4 rounded users" style="margin-top: 20px;height: 130px;margin-left: 140px;">
        <div>
            <div class="row">
                <div class="column">

                    <g:if test="${photo}">
                        <img style="width: 90px;height: 100px;margin-left: 10px"
                             src="data:image/jpg;base64,${photo}"/>
                    </g:if>
                    <g:else>
                        <asset:image src="xyz.jpg" alt="Myphoto" height="100px" width="90px"
                                     style="margin: 0px 10px 10px 10px;"/>
                    </g:else>
                </div>

                <div class="column">
                    <label style="font-size: 25px;margin: 0px 5px 0px 5px;"><b>${firstname} ${lastname}</b></label><br>
                    <label style="font-size: 14px;color: gray;margin: 0px 5px 0px 10px;">@${username}</label><br>
                    <label style="font-size: 14px;color: gray;margin: 0px 10px 0px 10px;">Subscriptions</label>
                    <label style="font-size: 14px;color: gray;margin: 0px 10px 0px 10px;">Topics</label><br>
                    <label style="font-size: 14px;margin: 0px 30px 0px 35px;color:blue;">50</label>
                    <label style="font-size: 14px;margin: 0px 30px 0px 45px;color: blue;">50</label>
                </div>
            </div>
        </div>
    </div>

    <div class="col-md-5 rounded-top r2c2" style="height: 330px;margin-top: 10px;">
        <div>
            <nav class="navbar navbar-expand-sm bg-secondary mynavl">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <b class="ls">Profile</b>
                    </li>
                </ul>
            </nav><br>
            <g:form controller="profile" action="changeDetails">
                <label class="p" style="margin-right: 125px;margin-left: 20px;">First name </label>
                <input type="text" name="fname" required><br><br>
                <label class="p" style="margin-right: 125px;margin-left: 20px;">Last name </label>
                <input type="text" name="lname" required><br><br>
                <label class="p" style="margin-right: 125px;margin-left: 20px;">Username </label>
                <input type="text" name="uname" required><br><br>
                <label style="font-size: 15px;margin-right: 148px;margin-left: 20px;">Photo </label>
                <input type="file" name="photo" required><br>
                <input type="submit" name="update" value="Update" class="sub" style="margin-right: 80px;"><br>
            </g:form>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-md-4 rounded-top topic" style="margin-left: 140px;margin-top: -170px;height: 280px">
        <div>
            <nav class="navbar navbar-expand-sm bg-secondary mynavl">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <b class="ls e">Topics</b>
                    </li>
                    <a href="#" style="font-size: 14px;margin: 5px 0px 0px 250px;"><u>View all</u></a>
                </ul>
            </nav>

            <g:each in="${topicList.take(2)}" var="s">
                <div class="row">
                    <div class="column">
                        <img style="width: 90px;height: 100px;margin-left: 10px;margin-top: 10px"
                             src="${createLink(controller: 'user', action: 'fetchUserImage',params:['emailId':s.createdBy.email])}"/>
                    </div>

                    <div class="column">
                        <label style="font-size: 14px;margin: 10px 10px 5px 5px;color: gray;"><a href="/topic" style="margin-right: 5px;"><u>${s.name}</u></a></label><br>
                        <label style="font-size: 14px;margin: 0px 30px 5px 5px;color: gray;">@${s.createdBy.username}</label>
                        <label style="font-size: 14px;margin: 0px 10px 5px 50px;color: gray;">Subscriptions</label>
                        <label style="font-size: 14px;margin: 0px 10px 5px 25px;color: gray;">Post</label><br>

                        <g:if test="${email  ==  s.createdBy.email }">
                            <a href="${createLink(controller: "subscription", action: "unsubscribe", params: [topicname: s.name, email: s.createdBy.email])}"
                               style="margin: 0px 30px 5px 5px;font-size: 13px;"><u>Unsubscribe</u></a>
                        </g:if>
                        <g:else>
                            <a href="${createLink(controller: "subscription", action: "subscribe", params: [topicname: s.name, email: s.createdBy.email])}"
                               style="margin: 0px 30px 5px 5px;font-size: 13px;"><u>Subscribe</u></a>
                        </g:else>

                        <label style="font-size: 14px;margin: 0px 30px 5px 75px;color:blue;">${subscribedTopics.size()}</label>
                        <label style="font-size: 14px;margin: 0px 30px 5px 30px;color: blue;">${linksharing.Resource.list().size()}</label><br>
                        <select id="ser" name="seriousness" style="margin-left: 5px">
                            <option value="Serious">Serious</option>
                            <option value="Casual">Casual</option>
                            <option value="VerySerious">VerySerious</option>
                        </select><br>
                    </div>
                </div>
            </g:each>


        </div>
    </div>

    <div class="col-md-5 rounded-top r2c2" style="height: 220px;margin-top: 10px;">
        <div>
            <nav class="navbar navbar-expand-sm bg-secondary mynavl">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <b class="ls">Change Password</b>
                    </li>
                </ul>
            </nav><br>
            <g:form controller="profile" action="changePassword">
                <label class="p" style="margin-right: 145px;margin-left: 20px;">Password </label>
                <input type="password" name="pass" ><br><br>
                <label class="p" style="margin-right: 90px;margin-left: 20px;">Confirm Password </label>
                <input type="password" name="cpass" ><br>

                <input type="submit" name="update" value="Update" class="sub" style="margin-right: 80px;"><br>
            </g:form>
        </div>
    </div>
</div>

</div>
</body>
</html>