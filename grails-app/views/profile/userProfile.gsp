<g:set var="firstname" value="${session.getAttribute("firstname")}"></g:set>
<g:set var="lastname" value="${session.getAttribute("lastname")}"></g:set>
<g:set var="username" value="${session.getAttribute("username")}"></g:set>
<g:set var="email" value="${session.getAttribute("email")}"></g:set>
<g:set var="photo" value="${session.getAttribute("photo")}"></g:set>
<g:set var="userId" value="${session.getAttribute("userId")}"></g:set>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>User Profile</title>
    <meta charset="UTF-8">
    %{--    <meta name="layout" content="main">--}%
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
            integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
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
    <link href="https://fonts.googleapis.com/css2?family=Flamenco&display=swap" rel="stylesheet">
    <asset:stylesheet src="custom.css"/>
    <asset:javascript src="myscript.js"/>
</head>

<body>
<h1>User Profile</h1>

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
                    <li><a href="${createLink(controller: "profile", action: "index")}">Profile</a></li>
                    <li><a href="${createLink(controller: "user", action: "dashboard")}">Dashboard</a></li>
                    <li><a href="${createLink(controller: "logout")}">Logout</a></li>
                </ul>
            </div>
        </li>

    </ul>
</nav>

<div class="row">
    <div class="col-md-4 rounded users" style="margin-top: 0px;height: 130px;margin-left: 100px;">
        <div>
            <div class="row">
                <div class="column">

                    <g:if test="${photo}">
                        <img style="width: 90px;height: 100px;margin-left: 15px"
                             src="data:image/jpg;base64,${photo}"/>
                    </g:if>
                    <g:else>
                        <asset:image src="xyz.jpg" alt="Myphoto" height="100px" width="90px"
                                     style="margin: 0px 10px 10px 15px;"/>
                    </g:else>
                </div>

                <div class="column" style="margin-left: 20px">
                    <label style="font-size: 25px;margin: 0px 5px 0px 5px;"><b>${firstname} ${lastname}</b></label><br>
                    <label style="font-size: 14px;color: gray;margin: 0px 5px 0px 10px;">@${username}</label><br>
                    <label style="font-size: 14px;color: gray;margin: 0px 10px 0px 10px;">Subscriptions</label>
                    <label style="font-size: 14px;color: gray;margin: 0px 10px 0px 10px;">Topics</label><br>
                    <label style="font-size: 14px;position: relative;left:40px;color:blue;"><ls:subscriptionCount
                            userId="${userId}"></ls:subscriptionCount></label>
                    <label style="font-size: 14px;position: relative;color:blue;left:120px;"><ls:topicCount
                            userId="${userId}"></ls:topicCount></label>
                </div>
            </div>
        </div>
    </div>

    <div class="col-md-6 rounded-top posts" style="height: 290px;margin-left: 15px;">
        <div>
            <nav class="navbar navbar-expand-sm bg-secondary mynavl">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <b class="ls e">Posts</b>
                    </li>
                </ul>
            </nav>

            <g:each in="${resourcesCreatedByUser.take(2)}" var="r">
                <div class="row">
                    <div class="column">
                        <g:if test="${r.createdBy.photo}">
                            <img style="width: 100px;height: 110px;margin-left: 30px;margin-top: 10px"
                                 src="${createLink(controller: 'user', action: 'fetchUserImage', params: ['emailId': r.createdBy.email])}"/>
                        </g:if>
                        <g:else>
                            <asset:image src="xyz.jpg" alt="Myphoto" height="100px" width="100px"
                                         style="margin: 10px 5px 10px 30px;"/>
                        </g:else>
                    </div>

                    <div class="column" style="margin-left: 20px">
                        <div style="height: 50px;width: 450px;">
                            <label style="font-size: 14px;margin: 12px 10px 0px 10px;"><b>${r.createdBy.firstName} ${r.createdBy.lastName}</b>
                            </label>
                            <label style="font-size: 14px;color: gray;position: relative;">@${r.createdBy.username}</label>
                            <label style="font-size: 12px;position: relative;float: right;margin-top: 12px;right: 10px"><a
                                    href="${createLink(controller: "topic", action: "topicPage", params: ['topicId': r.topic.id])}">${r.topic.name}</a>
                            </label>

                            <p class="txt" style="margin-top: 0px;">
                                <u><i><b>${r.description}</b></i></u><br>
                                <g:if test="${r.class == linksharing.DocumentResource}">
                                    Document : <g:link style="word-break: break-all">${r.filepath}</g:link>
                                </g:if>
                                <g:else>
                                    Link : <g:link style="word-break: break-all">${r.url}</g:link>
                                </g:else>
                            </p>
                            <a href="#" class="fa fa-facebook" style="margin : 8px 5px 5px 10px;"></a>
                            <a href="#" class="fa fa-twitter" style="margin : 8px 5px 5px 5px;color: purple"></a>
                            <a href="#" class="fa fa-google" style="margin : 8px 0px 5px 5px;color: red"></a>

                            <g:if test="${r.class == linksharing.DocumentResource}">
                                <a href="${createLink(controller: "resource", action: "download", params: [docResourceId: r.id])}"
                                   style="margin: 0px 5px 5px 140px;font-size: 12px;"><u>Download</u></a>
                            </g:if>

                            <g:if test="${r.class == linksharing.LinkResource}">
                                <a href="${r.url}" target="_blank"
                                   style="margin: 0px 5px 5px 150px;font-size: 12px;"><u>View full site</u>
                                </a>
                            </g:if>


                            <a href="${createLink(controller: "readingItem", action: "isRead,params:[userId:r.createdBy.id,resourceId:r.id,isState:true]")}"
                               style="margin: 0px 5px 5px 5px;font-size: 12px;" id="mar"><u>Mark as read</u></a>

                            <a href="${createLink(controller: "user", action: "postShow", params: ['resourceId': r.id])}"
                               style="margin: 0px 0px 5px 5px;font-size: 12px;"><u>View post</u></a>
                        </div>
                    </div>
                </div>
            </g:each>

        </div>
    </div>
</div>

<div class="row">
    <div class="col-md-4 rounded-top topic" style="margin-left: 100px;margin-top: -140px;height: 280px">
        <div>
            <nav class="navbar navbar-expand-sm bg-secondary mynavl">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <b class="ls e">Topics</b>
                    </li>
                    <a href="#" style="font-size: 14px;margin-top:5px;left: 300px;position:relative;color: black"><u>View all</u></a>
                </ul>
            </nav>

            <g:each in="${topicsCreatedByUser.take(2)}" var="s">
                <div class="row">
                    <div class="column">
                        <g:if test="${s.createdBy.photo}">
                            <img style="width: 90px;height: 100px;margin-left: 10px;margin-top: 10px"
                                 src="${createLink(controller: 'user', action: 'fetchUserImage',params:['emailId':s.createdBy.email])}"/>
                        </g:if>
                        <g:else>
                            <asset:image src="xyz.jpg" alt="Myphoto" height="100px" width="90px"
                                         style="margin: 10px 10px 10px 10px;"/>
                        </g:else>
                    </div>

                    <div class="column">
                        <label style="font-size: 14px;margin: 10px 10px 5px 5px;color: gray;"><a href="/topic" style="margin-right: 5px;"><u>${s.name}</u></a></label><br>
                        <label style="font-size: 14px;margin: 0px 30px 5px 5px;color: gray;">@${s.createdBy.username}</label>
                        <label style="font-size: 14px;margin: 0px 10px 5px 50px;color: gray;">Subscriptions</label>
                        <label style="font-size: 14px;margin: 0px 10px 5px 25px;color: gray;">Post</label><br>

                        <g:if test="${email  ==  s.createdBy.email }">
                            <a href="${createLink(controller: "profile", action: "unsubscribe", params: [topicname: s.name, email: s.createdBy.email])}"
                               style="margin: 0px 30px 5px 5px;font-size: 13px;"><u>Unsubscribe</u></a>
                        </g:if>
                        <g:else>
                            <a href="${createLink(controller: "profile", action: "subscribe", params: [topicname: s.name, email: s.createdBy.email])}"
                               style="margin: 0px 30px 5px 5px;font-size: 13px;"><u>Subscribe</u></a>
                        </g:else>

                        <label style="font-size: 14px;position: relative;left:80px;color:blue;"><ls:subscriptionCount userId="${userId}"></ls:subscriptionCount></label>
                        <label style="font-size: 14px;position: relative;left:170px;color:blue;"><ls:postCount topicId="${s.id}"></ls:postCount> </label><br>
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
</div>

<div class="row">
    <div class="col-md-4 rounded-top topic" style="margin-left: 100px;margin-top: 30px;height: 265px">

        <nav class="navbar navbar-expand-sm bg-secondary mynavl">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <b class="ls e">Subscriptions</b>
                </li>
                <a href="#" style="font-size: 14px;margin: 5px 0px 0px 250px;color: black"><u>View all</u></a>
            </ul>
        </nav>

        <div>
            <g:each in="${subscribedTopicsListOfUser.take(2)}" var="s">
                <div class="row">
                    <div class="column">
                        <g:if test="${s.user.photo}">
                            <img style="width: 90px;height: 100px;margin-left: 10px;margin-top: 10px"
                                 src="${createLink(controller: 'user', action: 'fetchUserImage',params:['emailId':s.user.email])}"/>
                        %{--                                  <asset:image src="xyz.jpg" alt="Myphoto" height="80px" width="80px" style="margin: 10px 5px 10px 10px;"/>--}%
                        </g:if>
                        <g:else>
                            <asset:image src="xyz.jpg" alt="Myphoto" height="100px" width="80px" style="margin: 10px 5px 10px 10px;"/>
                        </g:else>
                    </div>

                    <div class="column" style="margin-left: 20px">
                        <label style="font-size: 14px;margin: 10px 10px 5px 5px;color: gray;"><a href="/topic" style="margin-right: 5px;"><u>${s.topic.name}</u></a></label><br>
                        <label style="font-size: 14px;margin: 0px 30px 5px 5px;color: gray;">@${s.user.username}</label>
                        <label style="font-size: 14px;margin: 0px 10px 5px 50px;color: gray;">Subscriptions</label>
                        <label style="font-size: 14px;margin: 0px 10px 5px 25px;color: gray;">Post</label><br>

                        <label style="margin: 0px 30px 5px 5px;font-size: 13px;"><u><ls:showSubscribe userId="${userId}" topicId="${s.topic.id}"></ls:showSubscribe></u></label>

                        <label style="font-size: 14px;position: relative;float:right;color:blue;right: 110px"><ls:subscriptionCount userId="${s.user.id}"></ls:subscriptionCount> </label>
                        <label style="font-size: 14px;position: relative;float:right;color:blue;right: 15px"><ls:postCount topicId="${s.topic.id}"></ls:postCount> </label><br>
                        <select id="seri" name="seriousness" style="margin-left: 5px">
                            <option value="Serious">Serious</option>
                            <option value="Casual">Casual</option>
                            <option value="VerySerious">VerySerious</option>
                        </select><br>
                    </div>
                </div>
            </g:each>

        </div>
    </div>
</div>
</div>
</body>
</html>
