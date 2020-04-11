package linksharing

import grails.converters.JSON

import javax.servlet.http.HttpSession

class UserController {

    UserService userService

    def index() {

        Map model = userService.homePage()
        render(view : "user", model: model)
    }

    def registerUser() {
        String rslt = userService.registerUser(params,flash)
        render([success:rslt] as JSON)
    }

    def dashboard() {

        if (session.getAttribute("firstname")) {
            render(view: "dashboard", model: userService.dashboard(session))
        } else {
            flash.error = "Please Login First"
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
            session.setAttribute("admin",loggedInUser.admin)

            if (loggedInUser.photo != null) {
                String encode = Base64.getEncoder().encodeToString(loggedInUser.photo)
                session.setAttribute("photo", encode)
            } else {
                session.setAttribute("photo", null)
            }

            redirect(controller: "user", action: "dashboard")

        } else {
            if (loggedInUser != null && loggedInUser.active == false) {
                flash.error = "Sorry,You're Locked by an Admin"
                redirect(controller: "user")
            } else {
                flash.error = "Wrong Email Id or Password"
                redirect(controller: "user")
            }
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
        println(session.admin)
        if(session.getAttribute("firstname") && session.admin==true) {
            render(view: "userList", model: [list: Users.list()])
        } else {
            flash.message = "You are not authorised to view this page"
            redirect(controller: "user" , action: "dashboard")
        }
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
            flash.error = "Please Login First"
            redirect(controller: "user")
        }
    }

    def resetPassword() {
        Users user = Users.get(params.userId)
        render(view: "/user/resetPassword",model: [user:user])
    }

    def changePassword(){
        Users user = Users.findById(params.userId)
        if(user && params.password==params.confirmPassword){
            user.password = params.password
            user.save(flush:true , failOnError:true)
            render([success:true] as JSON)
        } else {
            render([success: false] as JSON)
        }
    }

    def forgotPassword() {
        String email = params.emailForgot
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



