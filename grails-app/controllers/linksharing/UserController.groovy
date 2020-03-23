package linksharing

import javax.servlet.http.HttpSession

class UserController {

//    UserService userService
    def index() {
        render(view:"user")
    }
    def register(){
        def p = request.getFile('rphoto')
        byte[] img = p.bytes

        User usr = new User(email : params.remail,username : params.runame,password : params.rpassword,firstName : params.rfname,lastName : params.rlname,admin : false,active : false,photo : img)
        usr.save(flush:true,failOnError :true)
            render(view: "user")

    }
    def login(){
        User vale = User.findByEmailAndPassword(params.logemail,params.logpassword)
       // User valu = User.findByUsernameAndPassword(params.logemail,params.logpassword)

        if(vale!=null) {
             HttpSession session = request.getSession();
             session.setAttribute("firstname",vale.firstName)
             session.setAttribute("lastname",vale.lastName)
             render(view: "dashboard")
         }else{
              flash.message = "Wrong Email Id or Password..Plz login again"
              render(view: "user")
         }
    }
}
