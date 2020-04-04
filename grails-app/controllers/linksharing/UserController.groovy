package linksharing

import grails.converters.JSON

import javax.servlet.http.HttpSession

class UserController {

    UserService userService

    def index() {
        List<Topic> topic = Topic.findAllByVisibility("Public")
        List<Resource> recentSharesPublicList = Resource.createCriteria().list(max: 5){
            inList("topic",topic)
            order("dateCreated","desc")
        }

        List<ResourceRating> topPosts = ResourceRating.createCriteria().list(max: 5) {
            order "score", "desc"
        }
        render(view:"user",model:[recentSharesPublicList:recentSharesPublicList,topPosts:topPosts])
    }

    def register(){

        Users usr = userService.registerUser(params)
        flash.message = "You have Registered Successfully"
        redirect(controller:"user",action:"index")

    }

    def dashboard(){

        if (session.getAttribute("firstname")) {

            Users usr = Users.findByEmail(session.getAttribute("email"))

            List<Subscription> subscribedTopicsListOfUser = Subscription.findAllByUser(usr)

            List<Topic> topicsCreatedByUser = Topic.findAllByCreatedBy(usr)

            List<Resource> resourcesCreatedByUser = Resource.findAllByCreatedBy(usr)

            List<Resource> trendingTopicsList = Resource.createCriteria().list(max: 5) {
                projections {
                    count("id", "t")
                }
                groupProperty("topic")
                order("t", "desc")
            }

            List<Topic> topic = Topic.findAllByVisibility("Public")
            List<Resource> resourceListForInbox = Resource.createCriteria().list {
                and {
                    not {
                        'in'("createdBy", usr)
                    }
                    inList("topic", topic)
                }
                order("dateCreated", "desc")
            }

            render(view: "dashboard", model: [subscribedTopicsListOfUser: subscribedTopicsListOfUser, topicsCreatedByUser: topicsCreatedByUser,
                                              resourcesCreatedByUser:resourcesCreatedByUser , resourceListForInbox: resourceListForInbox,
                                              trendingTopicsList: trendingTopicsList])
        } else {
            flash.message = "Please Login First"
            redirect(controller: "user")
        }
    }

    def login(){

        Users loggedInUser = userService.loginUser(params)
        if(loggedInUser!=null && loggedInUser.active==true) {
            HttpSession session = request.getSession();
            session.setAttribute("active",loggedInUser.active)
            session.setAttribute("userId",loggedInUser.id)
            session.setAttribute("firstname", loggedInUser.firstName)
            session.setAttribute("lastname", loggedInUser.lastName)
            session.setAttribute("username", loggedInUser.username)
            session.setAttribute("email", loggedInUser.email)

            if (loggedInUser.photo != null) {
                String encode = Base64.getEncoder().encodeToString(loggedInUser.photo)
                session.setAttribute("photo", encode)
            }else{
                session.setAttribute("photo", null)
            }

            redirect(controller: "user", action: "dashboard")

        }else{
            flash.message = "Wrong Email Id or Password"
            redirect(controller:"user")
        }
    }

    def fetchUserImage(){

        Users uemail = Users.findByEmail(params.emailId)
        byte[] imageInByte = uemail.photo
        response.contentType = 'image/*' // or the appropriate image content type
        response.outputStream << imageInByte
        response.outputStream.flush()

    }

    def userLists(){

        render(view: "userList",model: [list: Users.list(offSet: 0)])
    }

    def changeActiveStatus(){

        Users usr = Users.get(params.userId)
        if(usr.active==true){
            usr.active=false
        }else{
            usr.active=true
        }
        usr.save(flush:true,failOnError:true)
        redirect(controller: "user",action:"userLists")

    }

    def postShow(){

        Resource resource = Resource.get(params.resourceId)
        Users usr = Users.findByEmail(session.email)
        List<Topic> list1 = Topic.createCriteria().list {
            not {
                'in'("createdBy", usr)
            }
            order("dateCreated", "desc")
        }
        render(view: "post",model: [resource:resource,topicNotCreator:list1])
    }

}


