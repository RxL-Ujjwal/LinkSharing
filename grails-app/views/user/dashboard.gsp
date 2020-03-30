<!DOCTYPE html>
<html lang="en">
<head>
    <title>Dashboard</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <asset:stylesheet href="custom.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <asset:javascript src="myscript.js"></asset:javascript>
</head>

<body>
<h1>Dashboard</h1>
%{--<g:set var="firstname" value="session.getAttribute('firstname')" scope="session"></g:set>--}%
%{--<g:set var="lastname" value="session.getAttribute('lastname')" scope="session"></g:set>--}%
<g:if test="${flash.message}">
    <div class="panel">
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
            <img style="margin-top:5px;width: 40px;height: 40px;margin-left: 800px";
                 src="data:image/jpg;base64,${session.getAttribute("photo")}"/>
        </li>
        <li class="nav-item">
            <div class="dropdown" style="margin: 5px 5px 0px 5px;">
                <button class="btn btn-light dropdown-toggle" type="button" data-toggle="dropdown">${session.getAttribute("firstname")}
                    <span class="caret"></span></button>
                <ul class="dropdown-menu">
                    <li><a href="#">Profile</a></li>
                    <li><a href="#">Users</a></li>
                    <li><a href="#">Topics</a></li>
                    <li><a href="#">Posts</a></li><hr>
                    <li class="divider"></li>
                    <li><a href="${createLink(controller : "User")}">Logout</a></li>
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
%{--                    <img src="data:image/*;base64,${session.getAttribute("photo")}" alt="Myphoto" height="100px" width="90px" style="margin: 0px 10px 10px 10px;"/>--}%
                    <img style="width: 90px;height: 100px;margin-left: 10px"
                         src="data:image/jpg;base64,${session.getAttribute("photo")}"/>

                    %{--                        <asset:image src="xyz.jpg" alt="Myphoto" height="100px" width="90px" style="margin: 0px 10px 10px 10px;"/>--}%
                </div>
                <div class="column">
                    <label style="font-size: 25px;margin: 0px 5px 0px 5px;"><b>${session.getAttribute('firstname')} ${session.getAttribute('lastname')}</b></label><br>
                    <label style="font-size: 14px;color: gray;margin: 0px 5px 0px 10px;">@${session.getAttribute('username')}</label><br>
                    <label style="font-size: 14px;color: gray;margin: 0px 10px 0px 10px;">Subscriptions</label>
                    <label style="font-size: 14px;color: gray;margin: 0px 10px 0px 10px;">Topics</label><br>
                    <label style="font-size: 14px;margin: 0px 30px 0px 35px;color:blue;">50</label>
                    <label style="font-size: 14px;margin: 0px 30px 0px 45px;color: blue;">50</label>
                </div>
            </div>
        </div>
    </div>


    <div class="col-md-5 rounded-top posts" style="height: 150px;margin-left: 15px;">
        <div>
            <nav class="navbar navbar-expand-sm bg-secondary mynavl">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <b class="ls e">Inbox</b>
                    </li>
                </ul>
            </nav>
            <div class="row">
                <div class="column">
%{--                    <asset:image src="xyz.jpg" alt="Myphoto" height="80px" width="80px" style="margin: 10px 5px 10px 10px;"/>--}%
                        <img style="margin-top:5px;width: 90px;height: 100px;margin-left: 10px";
                         src="data:image/jpg;base64,${session.getAttribute("photo")}"/>
                </div>
                <div class="column">
                    <div style="height: 50px;width: 450px;">
                        <label style="font-size: 14px;margin: 12px 10px 0px 10px;"><b>${session.getAttribute('firstname')} ${session.getAttribute('lastname')}</b></label>
                        <label style="font-size: 14px;color: gray;margin: 12px 75px 0px 5px;">@${session.getAttribute('username')}</label>
                        <label style="font-size: 12px;margin: 12px 0px 0px 120px;"><a href="/topic">Grails</a></label>
                        <p class="txt" style="margin-top: 0px;"> Asset Pipeline uses a Class type called AssetFile.
                        These AssetFiles are included into the AssetHelper.assetSpecs static array.
                        That's how it works.
                        </p>
                        <a href="#" class="fa fa-facebook" style="margin : 8px 5px 5px 10px"></a>
                        <a href="#" class="fa fa-twitter" style="margin : 8px 5px 5px 5px"></a>
                        <a href="#" class="fa fa-google" style="margin : 8px 0px 5px 5px"></a>
                        <a href="topicshow.html" style="margin: 0px 5px 5px 80px;font-size: 12px;"><u>Download</u></a>
                        <a href="topicshow.html" style="margin: 0px 5px 5px 5px;font-size: 12px;"><u>View full site</u></a>
                        <a href="topicshow.html" style="margin: 0px 5px 5px 5px;font-size: 12px;"><u>Mark as read</u></a>
                        <a href="topicshow.html" style="margin: 0px 0px 5px 5px;font-size: 12px;"><u>View post</u></a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="col-md-4 rounded-top topic" style="margin-left: 100px;margin-top: -10px">
        <div>
            <nav class="navbar navbar-expand-sm bg-secondary mynavl">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <b class="ls e">Subscriptions</b>
                    </li>
                    <a href="#" style="font-size: 14px;margin: 5px 0px 0px 250px;"><u>View all</u></a>
                </ul>
            </nav>
            <div class="row">
                <div class="column">
%{--                    <asset:image src="xyz.jpg" alt="Myphoto" height="70px" width="60px" style="margin: 10px 10px 10px 10px;"/>
--}%
                    <img style="margin-top:5px;width: 90px;height: 100px;margin-left: 10px"
                         src="data:image/jpg;base64,${session.getAttribute("photo")}"/>
                </div>
                <div class="column">
                    <label style="font-size: 14px;margin: 10px 10px 5px 5px;color: gray;"><a href="/topic" style="margin-right: 5px;"><u>Grails</u></a></label>
                    <br>
                    <label style="font-size: 14px;margin: 0px 30px 5px 5px;color: gray;">@rcthomas</label>
                    <label style="font-size: 14px;margin: 0px 10px 5px 40px;color: gray;">Subscriptions</label>
                    <label style="font-size: 14px;margin: 0px 10px 5px 15px;color: gray;">Post</label><br>
                    <a href="topicshow.html" style="margin: 0px 30px 5px 5px;font-size: 13px;"><u>Unsubscribe</u></a>
                    <label style="font-size: 14px;margin: 0px 30px 5px 75px;color:blue;">50</label>
                    <label style="font-size: 14px;margin: 0px 30px 5px 30px;color: blue;">50</label>
                </div>
            </div>
        </div>
    </div>

    <div class="col-md-5 posts" style="height: 130px;margin-top: -6px;margin-left: 15px;">
        <div>
            <div class="row">
                <div class="column">
%{--                    <asset:image src="xyz.jpg" alt="Myphoto" height="80px" width="80px" style="margin: 0px 5px 10px 10px;"/>--}%
                    <img style="margin-top:5px;width: 90px;height: 100px;margin-left: 10px"
                         src="data:image/jpg;base64,${session.getAttribute("photo")}"/>
                </div>
                <div class="column">
                    <div style="height: 50px;width: 450px;margin-top: 0px;">
                        <label style="font-size: 14px;margin: 12px 10px 0px 10px;"><b>${session.getAttribute('firstname')} ${session.getAttribute('lastname')}</b></label>
                        <label style="font-size: 14px;color: gray;margin: 12px 75px 0px 5px;">@${session.getAttribute('username')}</label>
                        <label style="font-size: 12px;margin: 12px 0px 0px 120px;"><a href="/topic">Grails</a></label>
                        <p class="txt" style="margin-top: 0px;"> Asset Pipeline uses a Class type called AssetFile.
                        These AssetFiles are included into the AssetHelper.assetSpecs static array.
                        That's how it works.
                        </p>
                        <a href="#" class="fa fa-facebook" style="margin : 8px 5px 5px 10px"></a>
                        <a href="#" class="fa fa-twitter" style="margin : 8px 5px 5px 5px"></a>
                        <a href="#" class="fa fa-google" style="margin : 8px 0px 5px 5px"></a>
                        <a href="topicshow.html" style="margin: 0px 5px 5px 80px;font-size: 12px;"><u>Download</u></a>
                        <a href="topicshow.html" style="margin: 0px 5px 5px 5px;font-size: 12px;"><u>View full site</u></a>
                        <a href="topicshow.html" style="margin: 0px 5px 5px 5px;font-size: 12px;"><u>Mark as read</u></a>
                        <a href="topicshow.html" style="margin: 0px 0px 5px 5px;font-size: 12px;"><u>View post</u></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-4 topic" style="height: 150px;margin-top: -1px;margin-left: 100px;">
        <div>
            <div class="row">
                <div class="column">
%{--                    <asset:image src="xyz.jpg" alt="Myphoto" height="70px" width="60px" style="margin: 0px 10px 10px 10px;"/>--}%
                    <img style="margin-top:5px;width: 90px;height: 100px;margin-left: 10px"
                         src="data:image/jpg;base64,${session.getAttribute("photo")}"/>
                </div>
                <div class="column">

                </div>
            </div>
        </div>
    </div>


    <div class="column" style="margin-left: 15px;">
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
            Share Link
        </button>
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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

                            <g:select name="linkTopic" from="${linksharing.Topic.list().name}" id="inputTopic"/>
%{--                            <g:if test="${Topic.list()}">--}%
%{--                            <g:select name="linkTopic" from="${Topic.list().name}"--}%
%{--                                      id="inputTopic"/>--}%
%{--                            </g:if>--}%
%{--                            <g:else>--}%
%{--                                <b><g:message code="dashboard.createtopic.topic"></g:message></b>--}%
%{--                            </g:else>--}%

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

    <div class="column" style="margin-left: 25px;">
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#example">
            Share Document
        </button>
        <div class="modal fade" id="example" tabindex="-1" role="dialog" aria-labelledby="exampleModa" aria-hidden="true">
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
                            <g:select name="docTopic" from="${linksharing.Topic.list().name}" id="topicd"/>

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

    <div class="column" style="margin-left: 25px;">
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#examp">
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
                            <label style="margin-right: 45px;">Subject</label>
                            <input type="text" name="subject" id="sub"><br>
                            <label style="margin-right: 55px;">Body</label>
                            <g:textArea name="body" id="body" placeholder="Body"></g:textArea><br>
%{--                            <g:select name="emailTopic" from="${linksharing.Topic.list().name}" id="topice"/><br>--}%
                            <input type="Submit" value="Invite">
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

    <div class="column" style="margin-left: 25px;">
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#eg">
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
                        <g:form controller="topic" action="index">
                        <label style="margin-right: 55px;">Name</label>
                        <input type="name" name="name" id="name"><br>

                        <label style="margin-right: 40px;">Visibility</label>
                        <select id="vis" name="visibility">
                            <option value="Public">Public</option>
                            <option value="Private">Private</option>
                        </select><br>
                            <input type="Submit" value="Create" id="ctopic">
                        </g:form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>