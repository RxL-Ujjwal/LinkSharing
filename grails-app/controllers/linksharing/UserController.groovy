package linksharing

import grails.converters.JSON

import javax.servlet.http.HttpSession

class UserController {

    UserService userService

    def index() {
        render(view: "user", model: userService.homePage())
    }

    def register() {

        Users usr = userService.registerUser(params)
        flash.message = "You have Registered Successfully"
        redirect(controller: "user", action: "index")

    }

    def dashboard() {

        if (session.getAttribute("firstname")) {
            render(view: "dashboard", model: userService.dashboard(session))
        } else {
            flash.message = "Please Login First"
            redirect(controller: "user")
        }
    }

    def login() {

        Users loggedInUser = userService.loginUser(params)
        if (loggedInUser != null && loggedInUser.active == true) {
            HttpSession session = request.getSession();
            session.setAttribute("active", loggedInUser.active)
            session.setAttribute("userId", loggedInUser.id)
            session.setAttribute("firstname", loggedInUser.firstName)
            session.setAttribute("lastname", loggedInUser.lastName)
            session.setAttribute("username", loggedInUser.username)
            session.setAttribute("email", loggedInUser.email)

            if (loggedInUser.photo != null) {
                String encode = Base64.getEncoder().encodeToString(loggedInUser.photo)
                session.setAttribute("photo", encode)
            } else {
                session.setAttribute("photo", null)
            }

            redirect(controller: "user", action: "dashboard")

        } else {
            flash.message = "Wrong Email Id or Password"
            redirect(controller: "user")
        }
    }

    def fetchUserImage() {

        Users uemail = Users.findByEmail(params.emailId)
        byte[] imageInByte = uemail.photo
        response.contentType = 'image/*' // or the appropriate image content type
        response.outputStream << imageInByte
        response.outputStream.flush()

    }

    def userLists() {
        render(view: "userList", model: [list: Users.list(offSet: 0)])
    }

    def changeActiveStatus() {

        Users user = Users.get(params.userId)
        if (user.active == true) {
            user.active = false
        } else {
            user.active = true
        }
        user.save(flush: true, failOnError: true)
        redirect(controller: "user", action: "userLists")

    }

    def postShow() {

        if (session.getAttribute("firstname")) {
            render(view: "post", model: userService.postShow(params,session))
        } else {
            flash.message = "Please Login First"
            redirect(controller: "user")
        }
    }

        def resetPassword() {
            println(params.userId)
            Users user = Users.get(params.userId)
            render(view: "/user/resetPassword",model: [user:user])
        }

        def changePassword(){
            println(params)
            Users user = Users.findById(params.userId)
            if(user){
                user.password = params.password
                user.save(flush:true , failOnError:true)
                return([success:true] as JSON)
            }
            render([success:false] as JSON)
        }

        def forgotPassword() {
            String email = params.emailForgot
            println(email)
            println(params.emailForgot)
            Users user = Users.findByEmail(email)
            if (user) {
                println("Inside")
                sendMail {
                    to params.emailForgot
                    subject "Reset password"
                    text "http://localhost:9090/user/resetPassword?userId=${user.id}"
                }
                render([success: true] as JSON)
            } else {
                render([success: false] as JSON)
            }
        }
}



