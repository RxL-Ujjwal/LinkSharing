<!DOCTYPE html>
<html lang="en">
<head>
    <title>Dashboard</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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

<h1 style="margin-top: 15px;">Search</h1>

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
                    <li class="divider"></li>
                    <li><a href="${createLink(controller: "logout")}">Logout</a></li>
                </ul>
            </div>
        </li>
    </ul>
</nav>

%{--        *********** TRENDING TOPICS ************            --}%

<div class="container">
    <div class="row">
        <div class="col-md-5 rounded-top topic" style="height: 320px;overflow-y:scroll;margin-top: 5px;margin-left: 10px;">
            <nav class="navbar navbar-expand-sm bg-secondary mynavl" style="position: relative">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <b class="ls e">Trending Topics</b>
                    </li>
                    <a href="${createLink(controller: "subscription",action: "trendingTopicsList")}" style="font-size: 14px;margin: 5px 0px 0px 240px;color: black"><u>View all</u></a>
                </ul>
            </nav>

            <div>
                <g:each in="${trendingTopicsList.take(5)}" var="s">
                    <g:render template="/topic/topic" model="[topic:s[1]]"></g:render>
                </g:each>
            </div>
        </div>

%{--          ********** SEARCH BOX ************    --}%

        <div class="col-md-6 rounded-top posts" style="height: 290px;margin-left: 15px;">
            <div>
                <nav class="navbar navbar-expand-sm bg-secondary mynavl">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <b class="ls e">Search Results</b>
                        </li>
                    </ul>
                </nav>

%{--                <g:each in="${}" var="post">--}%
%{--                    --}%
%{--                </g:each>--}%

            </div>
        </div>
    </div>

%{--    **************** TOP POSTS ***************        --}%

    <div class="row">
        <div class="col-md-6 rounded-top r2c1" style="height: 290px;overflow-y: scroll;margin-left: 10px;margin-top: 10px">
            <div>
                <nav class="navbar navbar-expand-sm bg-secondary mynavl">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <b class="ls">Top posts</b>
                        </li>
                    </ul>
                </nav>

                <g:each var="u" in="${topPosts.take(5)}">
                    <div class="row">
                        <div class="column">
                            <g:if test="${u.resource.createdBy.photo}">
                                <img style="width: 90px;height: 110px;margin-left: 10px;margin-top: 10px"
                                     src="${createLink(controller: 'user', action: 'fetchUserImage',params:['emailId':u.resource.createdBy.email])}"/>
                            </g:if>
                            <g:else>
                                <asset:image src="xyz.jpg" alt="Myphoto" height="110px" width="90px" style="margin: 10px 5px 10px 10px;"/>
                            </g:else>
                        </div>
                        <div class="column">
                            <div style="height: 50px;width: 450px;margin-left: -5px">
                                <label style="font-size: 14px;margin: 12px 5px 0px 10px;"><b>${u.resource.createdBy.firstName} ${u.resource.createdBy.lastName}</b></label>
                                <label style="font-size: 14px;color: gray;margin: 12px 75px 0px 0px;">@${u.resource.createdBy.username}</label>

                                <label style="font-size: 12px;position: relative;float: right;margin-top: 12px;right: 10px"><a href=${createLink(controller: "user",action: "dashboard")}>${u.resource.topic.name}</a></label>
                                <p class="txt" style="margin-top: 0px;">
                                    <u><i><b>${u.resource.description}</b></i></u><br>
                                    <g:if test="${u.resource.class==linksharing.DocumentResource}">
                                        Document : <g:link controller="user" action="dashboard" style="word-break: break-all"> ${u.resource.filepath}</g:link>
                                    </g:if>
                                    <g:else>
                                        Link : <g:link controller="user" action="dashboard" style="word-break: break-all">${u.resource.url}</g:link>
                                    </g:else>
                                </p>
                                <a href="#" class="fa fa-facebook" style="margin : 8px 5px 5px 10px"></a>
                                <a href="#" class="fa fa-twitter" style="margin : 8px 5px 5px 5px;color: purple"></a>
                                <a href="#" class="fa fa-google" style="margin : 8px 105px 5px 5px;color: red"></a>

                                <a href="${createLink(controller: "user",action: "dashboard")}" style="margin: 0px 0px 5px 205px;font-size: 12px;"><u>View post</u></a>
                            </div>
                        </div>
                    </div>
                </g:each>

            </div>
        </div>
    </div>

</div>