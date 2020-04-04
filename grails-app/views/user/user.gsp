<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
            integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
            integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
            crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
            integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
            crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css2?family=Flamenco&display=swap" rel="stylesheet">
    <asset:stylesheet href="custom.css"/>
    <asset:javascript src="myscript.js"></asset:javascript>

</head>
<body>
    <h1>Home Page</h1>
    <g:if test="${flash.message}">
    <div class="panel animated shake">
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
        </ul>
      </nav>

      <div class="container mycontainer">
          <div class="row">
              <div class="col-md-6 rounded-top r1c1" style="height: 610px">
                  <div>
                      <nav class="navbar navbar-expand-sm bg-secondary mynavl ">
                          <ul class="navbar-nav">
                              <li class="nav-item">
                                  <b class="ls">Recent Shares</b>
                              </li>
                          </ul>
                      </nav>

                <div>
                 <g:each var="u" in="${recentSharesPublicList}">
                     <div class="row">
                          <div class="column">
                              <g:if test="${u.createdBy.photo}">
                                  <img style="width: 90px;height: 100px;margin-left: 10px;margin-top: 10px"
                                       src="${createLink(controller: 'user', action: 'fetchUserImage',params:['emailId':u.createdBy.email])}"/>
%{--                                  <asset:image src="xyz.jpg" alt="Myphoto" height="80px" width="80px" style="margin: 10px 5px 10px 10px;"/>--}%
                              </g:if>
                              <g:else>
                              <asset:image src="xyz.jpg" alt="Myphoto" height="100px" width="90px" style="margin: 10px 5px 10px 10px;"/>
                              </g:else>
                          </div>
                          <div class="column">
                              <div style="height: 50px;width: 450px;">
                                  <label style="font-size: 14px;margin: 12px 5px 0px 10px;"><b>${u.createdBy.firstName} ${u.createdBy.lastName}</b></label>
                                  <label style="font-size: 14px;color: gray;margin: 12px 75px 0px 0px;">@${u.createdBy.username}</label>
%{--                                  margin: 12px 0px 0px 120px--}%
                                  <label style="font-size: 12px;position: relative;float: right;margin-top: 12px;right: 10px"><a href=${createLink(controller: "user",action: "dashboard")}>${u.topic.name}</a></label>
                                  <p class="txt" style="margin-top: 0px;">
                                      <u><i><b>${u.description}</b></i></u><br>
                                      <g:if test="${u.class==linksharing.DocumentResource}">
                                          Document : <g:link controller="user" action="dashboard" style="word-break: break-all"> ${u.filepath}</g:link>
                                      </g:if>
                                      <g:else>
                                          Link : <g:link controller="user" action="dashboard" style="word-break: break-all">${u.url}</g:link>
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
              <!-- Login -->
              <div class="col-md-4 rounded-top r1c2" style="margin-top: 10px">
                  <div>
                    <nav class="navbar navbar-expand-sm bg-secondary mynavl">
                        <ul class="navbar-nav">
                          <li class="nav-item">
                             <b class="ls">Login</b>
                          </li>
                        </ul>
                      </nav><br>
                      <g:form name="loginform" url="[action:'login',controller:'user']">
                      <label class="e">Email/Username </label>
                      <input type="text" name="logemail" ><br><br>
                      <label class="p">Password </label>
                      <input type="password" name="logpassword" ><br>
                      <input type="submit" value="Login" class="sub">
                     </g:form>
                      <a class="fp" href="/user"><u>Forget Password</u></a>

                  </div>
              </div>
          </div>
          <div class="row">

            <div class="col-md-6 rounded-top r2c1" style="height: 290px">
                <div>
                    <nav class="navbar navbar-expand-sm bg-secondary mynavl">
                        <ul class="navbar-nav">
                          <li class="nav-item">
                             <b class="ls">Top posts</b>
                          </li>
                        </ul>
                      </nav>

                    <g:each var="u" in="${topPosts.take(2)}">
                        <div class="row">
                            <div class="column">
                                <g:if test="${u.user.photo}">
                                    <img style="width: 90px;height: 110px;margin-left: 10px;margin-top: 10px"
                                         src="${createLink(controller: 'user', action: 'fetchUserImage',params:['emailId':u.user.email])}"/>
                                %{--                                  <asset:image src="xyz.jpg" alt="Myphoto" height="80px" width="80px" style="margin: 10px 5px 10px 10px;"/>--}%
                                </g:if>
                                <g:else>
                                    <asset:image src="xyz.jpg" alt="Myphoto" height="110px" width="90px" style="margin: 10px 5px 10px 10px;"/>
                                </g:else>
                            </div>
                            <div class="column">
                                <div style="height: 50px;width: 450px;">
                                    <label style="font-size: 14px;margin: 12px 5px 0px 10px;"><b>${u.user.firstName} ${u.user.lastName}</b></label>
                                    <label style="font-size: 14px;color: gray;margin: 12px 75px 0px 0px;">@${u.user.username}</label>
                                    %{--                                  margin: 12px 0px 0px 120px--}%
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


              <div class="col-md-4 rounded-top r2c2" style="margin-top: -360px">
                <div>
                    <nav class="navbar navbar-expand-sm bg-secondary mynavl">
                        <ul class="navbar-nav">
                          <li class="nav-item">
                             <b class="ls">Register</b>
                          </li>
                        </ul>
                      </nav><br>
                      <g:uploadForm name="registerform" url="[action:'register',controller:'User']">
                      <label class="p">First name </label>
                      <input type="text" name="rfname" ><br><br>
                      <label class="p">Last name </label>
                      <input type="text" name="rlname" ><br><br>
                      <label class="p" style="margin-right: 82px;">Email</label>
                      <input type="email" name="remail" ><br><br>
                      <label class="p">Username </label>
                      <input type="text" name="runame" ><br><br>
                      <label class="p">Password </label>
                      <input type="password" name="rpassword" id="pass" ><br><br>
                      <label class="e" style="margin-right: -3px;">Confirm Password </label>
                      <input type="password" name="rcpassword" id="cpass" ><br><br>
                      <label style="font-size: 15px;">Photo </label>
                      <input type="file" name="rphoto" accept="image/*"><br>
                      <input type="submit" value="Register" class="sub" ><br><br>
                    </g:uploadForm>
                </div>
              </div>
          </div>
      </div>

</body>
</html>