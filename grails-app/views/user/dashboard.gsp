<g:set var="firstname" value="${session.getAttribute("firstname")}"></g:set>
<g:set var="lastname" value="${session.getAttribute("lastname")}"></g:set>
<g:set var="username" value="${session.getAttribute("username")}"></g:set>
<g:set var="email" value="${session.getAttribute("email")}"></g:set>
<g:set var="photo" value="${session.getAttribute("photo")}"></g:set>
<g:set var="userId" value="${session.getAttribute("userId")}"></g:set>


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

<body>
<h1 style="margin-top: 15px;">Dashboard</h1>

<g:if test="${flash.message}">
    <div class="panel animated shake">
        <div class="panel-body bg-info text-center">
            ${flash.message}
        </div>
    </div>
</g:if>

<div class="panel animated shake" id="infoDiv">
    <div class="panel-body bg-info text-center">
        <label id="info"></label>
    </div>
</div>

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
                    <li><a href="${createLink(controller: "user",action: "userLists")}">Users</a></li><hr>
                    <li class="divider"></li>
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
                    <label style="font-size: 14px;position: relative;left:40px;color:blue;"><ls:subscriptionCount userId="${userId}"></ls:subscriptionCount> </label>
                    <label style="font-size: 14px;position: relative;color:blue;left:120px;"><ls:topicCount userId="${userId}"></ls:topicCount></label>
                </div>
            </div>
        </div>
    </div>


    <div class="col-md-6 rounded-top posts" style="height: 290px;margin-left: 15px;">
        <div>
            <nav class="navbar navbar-expand-sm bg-secondary mynavl">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <b class="ls e">Inbox</b>
                    </li>
                </ul>
            </nav>

            <g:each in="${resourceListForInbox.take(2)}" var="r">
                <div class="row">
                    <div class="column">
                        <g:if test="${r.user.photo}">
                        <img style="width: 100px;height: 110px;margin-left: 30px;margin-top: 10px"
                             src="${createLink(controller: 'user', action: 'fetchUserImage',params:['emailId':r.user.email])}"/>
                        </g:if>
                        <g:else>
                            <asset:image src="xyz.jpg" alt="Myphoto" height="110px" width="100px" style="margin: 10px 5px 10px 30px;"/>
                        </g:else>
                    </div>

                    <div class="column" style="margin-left: 20px">
                    <div style="height: 50px;width: 450px;">
                        <label style="font-size: 14px;margin: 12px 10px 0px 10px;"><b>${r.user.firstName} ${r.user.lastName}</b>
                        </label>
                        <label style="font-size: 14px;color: gray;position: relative;">@${r.user.username}</label>
                        <label style="font-size: 12px;position: relative;float: right;margin-top: 12px;right: 10px"><a href="${createLink(controller: "topic",action: "topicPage",params: ['topicId':r.resource.topic.id])}">${r.resource.topic.name}</a></label>

                        <p class="txt" style="margin-top: 0px;">
                            <u><i><b>${r.resource.description}</b></i></u><br>
                            <g:if test="${r.resource.class==linksharing.DocumentResource}">
                                Document : <g:link controller="resource" action="download" style="word-break: break-all"> ${r.resource.filepath}</g:link>
                            </g:if>
                            <g:else>
                                Link : <g:link controller="user" action="dashboard" style="word-break: break-all">${r.resource.url}</g:link>
                            </g:else>
                        </p>
                        <a href="#" class="fa fa-facebook" style="margin : 8px 5px 5px 10px;"></a>
                        <a href="#" class="fa fa-twitter" style="margin : 8px 5px 5px 5px;color: purple"></a>
                        <a href="#" class="fa fa-google" style="margin : 8px 0px 5px 5px;color: red"></a>

                        <g:if test="${r.resource.class==linksharing.DocumentResource}">
                            <a href="${createLink(controller: "resource",action: "download",params: [docResourceId: r.resource.id])}" style="margin: 0px 5px 5px 140px;font-size: 12px;"><u>Download</u></a>
                        </g:if>

                        <g:if test="${r.resource.class==linksharing.LinkResource}">
                            <a href="${r.resource.url}" target="_blank" style="margin: 0px 5px 5px 140px;font-size: 12px;"><u>View full site</u>
                        </a>
                        </g:if>

%{--                        <label style="margin: 0px 5px 5px 0px;font-size: 12px;" id="mar"><u><ls:markAsRead userId="${userId}" resourceId="${r.id}"></ls:markAsRead></u></label>--}%

                        <a href="${createLink(controller: "readingItem",action: "isRead",params:['resourceId':r.resource.id])}" style="margin: 0px 5px 5px 5px;font-size: 12px;" id="mar"><u>Mark as read</u></a>

                        <a href="${createLink(controller: "user",action: "postShow",params: ['resourceId':r.resource.id])}" style="margin: 0px 0px 5px 5px;font-size: 12px;"><u>View post</u></a>
                    </div>
                 </div>
                </div>
            </g:each>

        </div>
    </div>


    <div class="col-md-4 rounded-top topic" style="margin-left: 100px;margin-top: -150px;height:320px;overflow-y: scroll">

        <nav class="navbar navbar-expand-sm bg-secondary mynavl" style="position: relative">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <b class="ls e">Subscriptions</b>
                    </li>
                    <a href="${createLink(controller: "subscription",action: "subscribedTopicsList")}" style="font-size: 14px;margin: 5px 0px 0px 250px;color: black"><u>View all</u></a>
                </ul>
        </nav>

        <div style="">
        <g:each in="${subscribedTopicsListOfUser.take(5)}" var="s">
            <g:render template="/topic/topic" model="[topic:s.topic]"></g:render>
        </g:each>
        </div>

    </div>
</div>


<div class="row">
    <div class="col-md-4 rounded-top topic" style="height: 320px;overflow-y:scroll;margin-top: 25px;margin-left: 100px;">
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


    <div class="column" style="margin-left: 35px;margin-top: -150px">
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
            Share Link
        </button>

        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Share Link</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>

                    <div class="modal-body">
                        <g:form controller="resource" action="shareLink">
                            <label style="margin-right: 65px;">Link</label>
                            <input type="text" name="link" id="li"><br>
                            <label style="margin-right: 15px;">Description</label>
                            <g:textArea name="descriptl" id="desl" placeholder="Description"></g:textArea><br>
                            <label style="margin-right: 60px;">Topic</label>

                            <g:select name="linkTopic" from="${subscribedTopicsListOfUser.topic.name}" id="inputTopic"/><br>

                            <input type="Submit" value="Share">
                        </g:form>
                    </div>

                    <div class="modal-footer">
                        %{--                        <button type="button" class="btn btn-primary">Share</button>--}%
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>

                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="column" style="margin-left: 25px;margin-top: -120px">
        <button type="button" class="btn btn-info" data-toggle="modal" data-target="#example">
            Share Document
        </button>

        <div class="modal fade" id="example" tabindex="-1" role="dialog" aria-labelledby="exampleModa"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModa">Share Document</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>

                    <div class="modal-body">
                        <g:uploadForm controller="resource" action="shareDoc">
                            <label style="margin-right: 25px;">Document</label>
                            <input type="file" name="document" id="doc"><br>
                            <label style="margin-right: 15px;margin-top: 0px">Description</label>
                        %{--                        input type="text" name="descript" id="des"><br>--}%
                            <g:textArea name="descriptd" id="desd" placeholder="Description"></g:textArea><br>
                            <label style="margin-right: 60px;">Topic</label>
                            <g:select name="docTopic" from="${subscribedTopicsListOfUser.topic.name}" id="topicd"/><br>

                        %{--                            <g:select name="docum" from="${Topic.list()}" id="tl"></g:select>--}%
                            <input type="Submit" value="Share">
                        </g:uploadForm>
                    </div>

                    <div class="modal-footer">
                        %{--                        <button type="button" class="btn btn-primary">Share</button>--}%
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>

                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="column" style="margin-left: 25px;margin-top: -90px">
        <button type="button" class="btn btn-success" data-toggle="modal" data-target="#examp">
            Send Invitation
        </button>

        <div class="modal fade" id="examp" tabindex="-1" role="dialog" aria-labelledby="exampleMod" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleMod">Send Invitation</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>

                    <div class="modal-body">
                        <g:form controller="emailSender" action="send">
                            <label style="margin-right: 55px;">Email</label>
                            <input type="email" name="address" id="email"><br>
                            <label style="margin-right: 40px;">Subject</label>
                            <input type="text" name="subject" id="sub"><br>
                            <label style="margin-right: 55px;">Body</label>
                            <g:textArea name="body" id="body" placeholder="Body"></g:textArea><br>
                        %{--                            <g:select name="emailTopic" from="${linksharing.Topic.list().name}" id="topice"/><br>--}%
                            <input type="Submit" style="float: right;position: relative;right:180px;" value="Invite">
                        </g:form>
                    </div>

                    <div class="modal-footer">
                        %{--                        <button type="button" class="btn btn-primary">Invite</button>--}%
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>

                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="column" style="margin-left: 25px;margin-top: -60px">
        <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#eg">
            Create Topic
        </button>

        <div class="modal fade" id="eg" tabindex="-1" role="dialog" aria-labelledby="exampleM" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleM">Create Topic</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>

                    <div class="modal-body">

                        <form>
                            <label style="margin-right: 55px;">Name</label>
                            <input type="name" name="name" id="name"><br>

                            <label style="margin-right: 40px;">Visibility</label>
                            <select id="vis" name="visibility">
                                <option value="Public">Public</option>
                                <option value="Private">Private</option>
                            </select><br>
                            <input type="button" value="Create" id="ctopic">
                        </form>

                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal" id="topicCancel">Cancel</button>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
