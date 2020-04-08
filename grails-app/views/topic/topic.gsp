<g:set var="firstname" value="${session.getAttribute("firstname")}"></g:set>
<g:set var="lastname" value="${session.getAttribute("lastname")}"></g:set>
<g:set var="username" value="${session.getAttribute("username")}"></g:set>
<g:set var="email" value="${session.getAttribute("email")}"></g:set>
<g:set var="photo" value="${session.getAttribute("photo")}"></g:set>
<g:set var="userId" value="${session.getAttribute("userId")}"></g:set>

<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TopicShow</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css2?family=Flamenco&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
    <asset:stylesheet href="custom.css"/>
</head>

<body style="height: 100vh;">
<h1>Topic Show</h1>

<g:if test="${flash.message}">
    <div class="panel animated shake">
        <div class="panel-body bg-info text-center">
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
                <button class="btn btn-light dropdown-toggle" type="button" data-toggle="dropdown">${firstname}
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
    <div class="row">
        <div class="col-md-4 rounded-top topic" style="margin-right: 15px;margin-left: 50px;height:150px">
            <div>
                <nav class="navbar navbar-expand-sm bg-secondary mynavl">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <b class="ls e">Topic:"${topic.name}"</b>
                        </li>
                    </ul>
                </nav>
                <div class="row">
                    <div class="column">

                        <g:if test="${topic.createdBy.photo}">
                            <img style="width: 80px;height: 100px;margin-left: 10px;margin-top: 10px"
                                 src="${createLink(controller: 'user', action: 'fetchUserImage',params:['emailId':topic.createdBy.email])}"/>
                        </g:if>
                        <g:else>
                            <asset:image src="xyz.jpg" alt="Myphoto" height="90px" width="80px" style="margin: 10px 5px 10px 10px;"/>
                        </g:else>

                    </div>

                    <div class="column" style="margin-left: 10px">
                        <label style="font-size: 14px;margin: 10px 10px 5px 5px;color: gray;"><a href="#" style="margin-right: 5px;"><u>${topic.name}</u></a>(${topic.visibility.name()})</label>
                        <br>
                        <label style="font-size: 14px;margin: 0px 30px 5px 5px;color: gray;">@${topic.createdBy.username}</label>
                        <label style="font-size: 14px;margin: 0px 10px 5px 30px;color: gray;">Subscriptions</label>
                        <label style="font-size: 14px;margin: 0px 10px 5px 10px;color: gray;">Post</label><br>
                        <label style="margin: 0px 30px 5px 5px;font-size: 13px;"><u><ls:showSubscribe userId="${userId}" topicId="${topic.id}"></ls:showSubscribe></u></label>
                        <label style="font-size: 14px;position: relative;float:right;color:blue;right: 100px"><ls:subscriptionCount topicId="${topic.id}"></ls:subscriptionCount> </label>
                        <label style="font-size: 14px;position: relative;float:right;color:blue;right: 15px"><ls:postCount topicId="${topic.id}"></ls:postCount> </label>
                    </div>

                </div>
            </div>
        </div>

        <div class="col-md-7 rounded-top posts" style="height: 290px;margin-left: 5px">
            <div>
                <nav class="navbar navbar-expand-sm bg-secondary mynavl">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <b class="ls e">Topic:"${topic.name}"</b>
                        </li>
                    </ul>
                </nav>

                <g:each in="${postsRelatedToThisTopic.take(2)}" var="r">
                    <div class="row">
                        <div class="column">
                            <g:if test="${r.createdBy.photo}">
                                <img style="width: 100px;height: 110px;margin-left: 30px;margin-top: 10px"
                                     src="${createLink(controller: 'user', action: 'fetchUserImage',params:['emailId':r.createdBy.email])}"/>
                            </g:if>
                            <g:else>
                                <asset:image src="xyz.jpg" alt="Myphoto" height="100px" width="100px" style="margin: 10px 5px 10px 30px;"/>
                            </g:else>
                        </div>

                        <div class="column" style="margin-left: 20px">
                            <div style="height: 50px;width: 450px;">
                                <label style="font-size: 14px;margin: 12px 10px 0px 10px;"><b>${r.createdBy.firstName} ${r.createdBy.lastName}</b>
                                </label>

                                <p class="txt" style="margin-top: 0px;">
                                    <u><i><b>${r.description}</b></i></u><br>
                                    <g:if test="${r.class==linksharing.DocumentResource}">
                                        Document : <g:link style="word-break: break-all"> ${r.filepath}</g:link>
                                    </g:if>
                                    <g:else>
                                        Link : <g:link style="word-break: break-all">${r.url}</g:link>
                                    </g:else>
                                </p>
                                <a href="#" class="fa fa-facebook" style="margin : 8px 5px 5px 10px;"></a>
                                <a href="#" class="fa fa-twitter" style="margin : 8px 5px 5px 5px;color: purple"></a>
                                <a href="#" class="fa fa-google" style="margin : 8px 0px 5px 5px;color: red"></a>

                                <g:if test="${r.class==linksharing.DocumentResource}">
                                    <a href="${createLink(controller: "resource",action: "download",params: [resourceId: r.id])}" style="margin: 0px 5px 5px 160px;font-size: 12px;"><u>Download</u></a>
                                </g:if>

                                <g:if test="${r.class==linksharing.LinkResource}">
                                    <a href="${r.url}" target="_blank" style="margin: 0px 5px 5px 150px;font-size: 12px;"><u>View full site</u>
                                    </a>
                                </g:if>
                                <a href="topicshow.html" style="margin: 0px 5px 5px 5px;font-size: 12px;"><u>Mark as read</u>
                                </a>
                                <a href="${createLink(controller: "user",action: "postShow",params: ['resourceId':r.id])}" style="margin: 0px 0px 5px 5px;font-size: 12px;"><u>View post</u></a>
                            </div>
                        </div>
                    </div>
                </g:each>


            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-4 rounded-top users" style="margin-left: 50px;margin-right: 15px;height: 280px;margin-top: -120px">
            <div>
                <nav class="navbar navbar-expand-sm bg-secondary mynavl">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <b class="ls e">Users:"${topic.name}"</b>
                        </li>
                    </ul>
                </nav>

                <g:each in="${subscribedUsersOfThisTopic.take(2)}" var="u">
                    <div class="row">
                        <div class="column">
                            <g:if test="${u.user.photo}">
                                <img style="width: 80px;height: 100px;margin-left: 10px;margin-top: 10px"
                                     src="${createLink(controller: 'user', action: 'fetchUserImage',params:['emailId':u.user.email])}"/>
                            </g:if>
                            <g:else>
                                <asset:image src="xyz.jpg" alt="Myphoto" height="90px" width="80px" style="margin: 10px 5px 10px 10px;"/>
                            </g:else>
                        </div>

                        <div class="column" style="margin-left: 20px">
                            <label style="font-size: 20px;margin: 10px 5px 0px 5px;">${u.user.firstName} ${u.user.lastName}</label><br>
                            <label style="font-size: 14px;color: gray;margin: 0px 5px 0px 10px;">@${u.user.username}</label><br>
                            <label style="font-size: 14px;color: gray;margin: 0px 10px 0px 10px;">Subscriptions</label>
                            <label style="font-size: 14px;color: gray;margin: 0px 10px 0px 10px;">Topics</label><br>
                            <label style="font-size: 14px;position: relative;float:right;color:blue;right: 125px">${subscribedUsersOfThisTopic.size()}</label>
                            <label style="font-size: 14px;position: relative;float:right;color:blue;right: 20px">${postsRelatedToThisTopic.size()}</label>
                        </div>
                    </div>
                </g:each>

            </div>
        </div>
    </div>


</div>
</body>
</html>