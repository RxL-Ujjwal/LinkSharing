package linksharing

class ProfileController {

    def index() {
        if(session.email) {
            Users usr = Users.findByEmail(session.getAttribute("email"))

            List<Subscription> subscribedTopicsListOfUser = Subscription.findAllByUser(usr)

            List<Topic> topicsCreatedByUser = Topic.findAllByCreatedBy(usr)

            List<Resource> resourcesCreatedByUser = Resource.findAllByCreatedBy(usr)

            render(view: "/user/profile", model: [subscribedTopicsListOfUser: subscribedTopicsListOfUser,
                                                  topicsCreatedByUser       : topicsCreatedByUser, resourcesCreatedByUser: resourcesCreatedByUser])
        } else {
            flash.message = "Please Login First"
            redirect(controller: "user")
        }
    }

    def subscribe(){
        Users usr = Users.findByEmail(params.email)
        Topic topic = Topic.findByCreatedByAndName(usr,params.topicname)
        println(params.seriousness)
        Subscription sub = new Subscription(topic:topic,user:usr,seriousness:Subscription.Seriousness.VerySerious.name())
        topic.addToSubscriptions(sub)
        topic.save(failOnError:true,flush:true)
        flash.message="You have subscribed the topic ${sub.topic.name}"
        redirect(controller:"profile",action: "index")
    }

    def unsubscribe(){
        Users usr = Users.findByEmail(params.email)
        Topic topic = Topic.findByCreatedByAndName(usr,params.topicname)
        if(topic.createdBy==usr ){
            flash.message = "You cannot unsubscribe this topic"
        }else{
            Subscription sub = Subscription.findByUsersAndTopic(usr,topic)
            sub.delete(failOnError: true,flush:true)
            flash.message = "You have successfully unsubscribed the topic ${sub.topic.name}"
        }
        redirect(controller: "profile",action: "index")
    }

    def changeDetails() {
        Users usr = Users.findByEmail(session.getAttribute("email"))
        usr.firstName = params.fname
        usr.lastName = params.lname
        usr.username = params.uname
        usr.photo = params.photo.bytes
        usr.save(flush: true, failOnError: true)

        session.setAttribute("firstname", usr.firstName)
        session.setAttribute("lastname", usr.lastName)
        session.setAttribute("username", usr.username)
        String encode = Base64.getEncoder().encodeToString(usr.photo)
        session.setAttribute("photo", encode)

        flash.message = "Your profile has been updated"
        redirect(controller: "user", action: "dashboard")

    }
    def changePassword(){
        Users usr = Users.findByEmail(session.getAttribute("email"))
        if(params.pass==params.cpass){
            usr.password = params.pass
            usr.save(flush: true, failOnError: true)
            flash.message = "Your password has been updated"
            redirect(controller: "user",action: "dashboard")
        }else{
            flash.message = "Password Mismatch"
            redirect(controller:"profile")
        }
    }
    def userProfile(){
        render(view:"userProfile")
    }
}
