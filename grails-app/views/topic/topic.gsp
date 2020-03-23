<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TopicShow</title>
    <asset:stylesheet href="custom.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>

<body>
<h1>Topic Show</h1>
<nav class="navbar navbar-expand-sm bg-light rounded mynav">
    <ul class="navbar-nav">
        <li class="nav-item">
            <a class="nav-link" href="#"><u class="ls">Link Sharing</u></a>
        </li>
    </ul>
</nav>
<div class="container">
    <div class="row">
        <div class="col-md-4 rounded-top topic">
            <div>
                <nav class="navbar navbar-expand-sm bg-secondary mynavl">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <b class="ls e">Topic:"Grails"</b>
                        </li>
                    </ul>
                </nav>
                <div class="row">
                    <div class="column">
                        <asset:image src="xyz.jpg" alt="Myphoto" height="70px" width="60px" style="margin: 10px 10px 10px 10px;"/>
                    </div>
                    <div class="column">
                        <label style="font-size: 14px;margin: 10px 10px 5px 5px;color: gray;"><a href="topicshow.html" style="margin-right: 5px;"><u>Grails</u></a>(Private)</label>
                        <br>
                        <label style="font-size: 14px;margin: 0px 30px 5px 5px;color: gray;">@uname</label>
                        <label style="font-size: 14px;margin: 0px 10px 5px 30px;color: gray;">Subscriptions</label>
                        <label style="font-size: 14px;margin: 0px 10px 5px 10px;color: gray;">Post</label><br>
                        <a href="topicshow.html" style="margin: 0px 30px 5px 5px;font-size: 13px;"><u>Subscribe</u></a>
                        <label style="font-size: 14px;margin: 0px 30px 5px 55px;color:blue;">50</label>
                        <label style="font-size: 14px;margin: 0px 30px 5px 35px;color: blue;">50</label>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-6 rounded-top posts">
            <div>
                <nav class="navbar navbar-expand-sm bg-secondary mynavl">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <b class="ls e">Topic:"Grails"</b>
                        </li>
                    </ul>
                </nav>
                <div class="row">
                    <div class="column">
                        <asset:image src="xyz.jpg" alt="Myphoto" height="80px" width="80px" style="margin: 10px 5px 10px 10px;"/>
                    </div>
                    <div class="column">
                        <div style="height: 50px;width: 450px;">
                            <p class="txt"> Asset Pipeline uses a Class type called AssetFile.
                            These AssetFiles are included into the AssetHelper.assetSpecs static array.
                            That's how it works.
                            </p>
                            <a href="topicshow.html" style="margin: 0px 5px 5px 160px;font-size: 12px;"><u>Download</u></a>
                            <a href="topicshow.html" style="margin: 0px 5px 5px 5px;font-size: 12px;"><u>View full site</u></a>
                            <a href="topicshow.html" style="margin: 0px 5px 5px 5px;font-size: 12px;"><u>Mark as read</u></a>
                            <a href="topicshow.html" style="margin: 0px 0px 5px 5px;font-size: 12px;"><u>View post</u></a>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="column">
                        <asset:image src="xyz.jpg" alt="Myphoto" height="80px" width="80px" style="margin: 10px 5px 10px 10px;"/>
                    </div>
                    <div class="column">
                        <div style="height: 50px;width: 450px;">
                            <p class="txt"> Asset Pipeline uses a Class type called AssetFile.
                            These AssetFiles are included into the AssetHelper.assetSpecs static array.
                            That's how it works.
                            </p>
                            <a href="topicshow.html" style="margin: 0px 5px 5px 160px;font-size: 12px;"><u>Download</u></a>
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
        <div class="col-md-4 rounded-top users">
            <div>
                <nav class="navbar navbar-expand-sm bg-secondary mynavl">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <b class="ls e">Users:"Grails"</b>
                        </li>
                    </ul>
                </nav>
                <div class="row">
                    <div class="column">
                        <asset:image src="xyz.jpg" alt="Myphoto" height="90px" width="80px" style="margin: 10px 10px 10px 10px;"/>
                    </div>
                    <div class="column">
                        <label style="font-size: 20px;margin: 10px 5px 0px 5px;">Uday Pratap Singh</label><br>
                        <label style="font-size: 14px;color: gray;margin: 0px 5px 0px 10px;">@uday</label><br>
                        <label style="font-size: 14px;color: gray;margin: 0px 10px 0px 10px;">Subscriptions</label>
                        <label style="font-size: 14px;color: gray;margin: 0px 10px 0px 10px;">Topics</label><br>
                        <label style="font-size: 14px;margin: 0px 30px 0px 35px;color:blue;">50</label>
                        <label style="font-size: 14px;margin: 0px 30px 0px 45px;color: blue;">50</label>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-4 users" style="margin-top: -1px;height: 125px;">
            <div>
                <div class="row">
                    <div class="column">
                        <asset:image src="xyz.jpg" alt="Myphoto" height="90px" width="80px" style="margin: 0px 10px 10px 10px;"/>
                    </div>
                    <div class="column">
                        <label style="font-size: 20px;margin: 0px 5px 0px 5px;">Uday Pratap Singh</label><br>
                        <label style="font-size: 14px;color: gray;margin: 0px 5px 0px 10px;">@uday</label><br>
                        <label style="font-size: 14px;color: gray;margin: 0px 10px 0px 10px;">Subscriptions</label>
                        <label style="font-size: 14px;color: gray;margin: 0px 10px 0px 10px;">Topics</label><br>
                        <label style="font-size: 14px;margin: 0px 30px 0px 35px;color:blue;">50</label>
                        <label style="font-size: 14px;margin: 0px 30px 0px 45px;color: blue;">50</label>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>