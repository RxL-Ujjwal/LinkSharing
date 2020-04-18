<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="Grails"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>

    <asset:stylesheet src="application.css"/>
    <asset:stylesheet src="custom.css"/>

    <g:layoutHead/>
</head>

<body>

<g:set var="photo" value="${session.getAttribute("photo")}"></g:set>
<nav class="navbar navbar-expand-sm bg-light rounded mynav">
    <ul class="navbar-nav">
        <li class="nav-item">
            <a class="nav-link" href="#"><u class="ls">Link Sharing</u></a>
        </li>
        <li class="nav-item">

            <g:if test="${photo}">
                <img style="margin-top:5px;width: 40px;height: 40px;margin-left: 800px" ;
                     src="data:image/jpg;base64,${photo}"/>
            </g:if>
            <g:else>
                <asset:image src="xyz.jpg" alt="Myphoto" height="40px" width="40px"
                             style="margin: 0px 0px 0px 790px;"/>
            </g:else>

        </li>

        <li class="nav-item">
            <div class="dropdown" style="margin: 5px 5px 0px 5px;">
                <button class="btn btn-light dropdown-toggle" type="button" data-toggle="dropdown">${firstname}
                    <span class="caret"></span></button>
                <ul class="dropdown-menu">
                    <li><a href="${createLink(controller: "user",action: "dashboard")}">Dashboard</a></li>
                    <li><a href="${createLink(controller: "logout")}">Logout</a></li>
                </ul>
            </div>

        </li>
    </ul>
</nav>

<g:layoutBody/>

<div class="footer row" role="contentinfo">
    <div class="col">
        <a href="http://guides.grails.org" target="_blank">
            <asset:image src="advancedgrails.svg" alt="Grails Guides" class="float-left"/>
        </a>
        <strong class="centered"><a href="http://guides.grails.org" target="_blank">Grails Guides</a></strong>
        <p>Building your first Grails app? Looking to add security, or create a Single-Page-App? Check out the <a href="http://guides.grails.org" target="_blank">Grails Guides</a> for step-by-step tutorials.</p>

    </div>
    <div class="col">
        <a href="http://docs.grails.org" target="_blank">
            <asset:image src="documentation.svg" alt="Grails Documentation" class="float-left"/>
        </a>
        <strong class="centered"><a href="http://docs.grails.org" target="_blank">Documentation</a></strong>
        <p>Ready to dig in? You can find in-depth documentation for all the features of Grails in the <a href="http://docs.grails.org" target="_blank">linksharing.Users Guide</a>.</p>

    </div>

    <div class="col">
        <a href="https://grails-slack.cfapps.io" target="_blank">
            <asset:image src="slack.svg" alt="Grails Slack" class="float-left"/>
        </a>
        <strong class="centered"><a href="https://grails-slack.cfapps.io" target="_blank">Join the Community</a></strong>
        <p>Get feedback and share your experience with other Grails developers in the community <a href="https://grails-slack.cfapps.io" target="_blank">Slack channel</a>.</p>
    </div>
</div>


<div id="spinner" class="spinner" style="display:none;">
    <g:message code="spinner.alt" default="Loading&hellip;"/>
</div>

<asset:javascript src="application.js"/>

</body>
</html>
