package linksharing

import javax.servlet.http.HttpSession

class LogoutController {

    def index() {
        HttpSession session = request.getSession(false);
        if(session!=null){
            session.invalidate()
            flash.message = "Logout Successful"
        }else{
            flash.message = "Please Login again"
        }
        redirect(controller:"user")
    }
}
