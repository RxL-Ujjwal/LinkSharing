package linksharing

class LogoutController {

    def index() {
        redirect controller : "User"
        def name = session.getAttribute("firstname")
        if(name!=null){
            session.invalidate()
            redirect(uri:"User/index")
           // render(view: "user")

        }else{
            flash.message = "Please Login Again"
            render(view: "user")
            }
       }
}
