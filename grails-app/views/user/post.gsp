<g:set var="firstname" value="${session.getAttribute("firstname")}"></g:set>
<g:set var="lastname" value="${session.getAttribute("lastname")}"></g:set>
<g:set var="username" value="${session.getAttribute("username")}"></g:set>
<g:set var="email" value="${session.getAttribute("email")}"></g:set>
<g:set var="photo" value="${session.getAttribute("photo")}"></g:set>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Post</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <asset:stylesheet href="custom.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <asset:javascript src="myscript.js"/>
</head>

<body>
<h1>Post</h1>

<nav class="navbar navbar-expand-sm bg-light rounded mynav">
    <ul class="navbar-nav">
        <li class="nav-item">
            <a class="nav-link" href="#"><u class="ls">Link Sharing</u></a>
        </li>

        <li class="nav-item">
            <img style="margin-top:5px;width: 40px;height: 40px;margin-left: 790px" ;
                 src="data:image/jpg;base64,${photo}"/>
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

<div class="row">
    <div class="col-md-6 rounded posts" style="margin-top: 0px;height: 300px;margin-left: 100px;">
        <div>
            <div class="row">
                <div class="column">

                    <g:if test="${photo}">
                        <img style="width: 90px;height: 100px;margin-left: 40px"
                             src="data:image/jpg;base64,${photo}"/>
                    </g:if>
                    <g:else>
                        <asset:image src="xyz.jpg" alt="Myphoto" height="100px" width="90px"
                                     style="margin: 0px 10px 10px 10px;"/>
                    </g:else>

                </div>

                <div class="column">
                    <div style="height: 50px;width: 450px;">
                        <label style="font-size: 25px;margin: 12px 95px 0px 10px;"><b>${firstname} ${lastname}</b>
                        </label>
                        <label style="font-size: 20px;margin: 12px 0px 0px 75px;"><a
                                href="${createLink(controller: "topic",action: "topicPage",params: ['topicId':resource.topic.id])}"><u>${resource.topic.name}</u></a></label>
                        <label style="font-size: 17px;color: gray;margin: 12px 75px 0px 10px;">@${username}</label>

                        <div class="rating">

                            <input type="radio" id="star5" name="rating" value="5"/><label for="star5"
                                                                                           title="Exceptional">5 stars</label>
                            <input type="radio" id="star4" name="rating" value="4"/><label for="star4"
                                                                                           title="Excellent">4 stars</label>
                            <input type="radio" id="star3" name="rating" value="3"/><label for="star3"
                                                                                           title="Nice">3 stars</label>
                            <input type="radio" id="star2" name="rating" value="2"/><label for="star2"
                                                                                           title="Kinda bad">2 stars</label>
                            <input type="radio" id="star1" name="rating" value="1"/><label for="star1"
                                                                                           title="Very bad">1 star</label>

                            <div class="res" hidden>${resource.id}</div>
                            <div id="message"></div>
                        </div><br>

                        <p class="txt" style="margin:30px 5px 5px -60px;font-size: 18px">
                            <u><i><b>${resource.description}</b></i></u><br>
                            <g:if test="${resource.class == linksharing.DocumentResource}">
                                Document : <g:link style="word-break: break-all">${resource.filepath}</g:link>
                            </g:if>
                            <g:else>
                                Link : <g:link style="word-break: break-all">${resource.url}</g:link>
                            </g:else>
                        </p>
                        <a href="#" class="fa fa-facebook" style="margin : 8px 5px 5px -60px;font-size: 25px"></a>
                        <a href="#" class="fa fa-twitter"
                           style="margin : 8px 5px 5px 5px;font-size: 25px;color: purple"></a>
                        <a href="#" class="fa fa-google"
                           style="margin : 8px 0px 5px 5px;font-size: 25px;color: red"></a>

                        <a href="topicshow.html" style="margin: 0px 5px 5px 200px;font-size: 18px;"><u>Download</u></a>
                        <a href="topicshow.html" style="margin: 0px 5px 5px 5px;font-size: 18px;"><u>View full site</u>
                        </a>

                    </div>
                </div>
            </div>
        </div>
    </div>

            <div class="col-md-4 rounded-top topic" style="height: 285px;margin-top: 25px;margin-left: 10px;">
                <nav class="navbar navbar-expand-sm bg-secondary mynavl">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <b class="ls e">Trending Topics</b>
                        </li>
                        <a href="#" style="font-size: 14px;margin: 5px 0px 0px 200px;"><u>View all</u></a>
                    </ul>
                </nav>

                <div>
                    <g:each in="${topicNotCreator.take(2)}" var="s">
                        <div class="row">
                            <div class="column">
                                <g:if test="${s.createdBy.photo}">
                                    <img style="width: 85px;height: 100px;margin-left: 10px;margin-top: 10px"
                                         src="${createLink(controller: 'user', action: 'fetchUserImage',params:['emailId':s.createdBy.email])}"/>
                                %{--                                  <asset:image src="xyz.jpg" alt="Myphoto" height="80px" width="80px" style="margin: 10px 5px 10px 10px;"/>--}%
                                </g:if>
                                <g:else>
                                    <asset:image src="xyz.jpg" alt="Myphoto" height="80px" width="80px" style="margin: 10px 5px 10px 10px;"/>
                                </g:else>
                            </div>

                            <div class="column">
                                <label style="font-size: 14px;margin: 10px 10px 5px 5px;color: gray;"><a href="/topic" style="margin-right: 5px;"><u>${s.name}</u></a></label><br>
                                <label style="font-size: 14px;margin: 0px 30px 5px 5px;color: gray;">@${s.createdBy.username}</label>
                                <label style="font-size: 14px;margin: 0px 0px 5px 60px;color: gray;">Subscriptions</label>
                                <label style="font-size: 14px;margin: 0px 10px 5px 25px;color: gray;">Post</label><br>

                                <g:if test="${email  ==  s.createdBy.email }">
                                    <a href="${createLink(controller: "subscription", action: "unsubscribe", params: [topicname: s.name, email: s.createdBy.email])}"
                                       style="margin: 0px 30px 5px 5px;font-size: 13px;"><u>Unsubscribe</u></a>
                                </g:if>
                                <g:else>
                                    <a href="${createLink(controller: "subscription", action: "subscribe", params: [topicname: s.name, email: s.createdBy.email,seriousness:seriousness])}"
                                       style="margin: 0px 30px 5px 5px;font-size: 13px;"><u>Subscribe</u></a>
                                </g:else>

                                <label style="font-size: 14px;margin: 0px 30px 5px 115px;color:blue;">50</label>
                                <label style="font-size: 14px;margin: 0px 30px 5px 30px;color: blue;">50</label><br>
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
