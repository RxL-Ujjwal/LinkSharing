package linksharing

class ProfileController {

    def index() {
        Users usr = Users.findByEmail(session.getAttribute("email"))

        List list = Subscription.createCriteria().list {
            and {
                inList("user", usr)
                order("dateCreated", "desc")
            }
        }
        List lst = Topic.createCriteria().list{
            and{
                inList("createdBy", usr)
                order("dateCreated", "desc")
            }
        }
        render(view:"/user/profile",model:[subscribedTopics: list,topicList:lst])
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
}
