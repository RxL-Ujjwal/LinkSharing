package linksharing

import grails.gorm.transactions.Transactional

@Transactional
class UserService {

    def serviceMethod() {}

    //Register User in the Database
    def registerUser(params) {
        println("**********")
        println(params.rphoto)
        Users usr = new Users(email: params.remail, username: params.runame, password: params.rpassword, firstName: params.rfname, lastName: params.rlname, admin: false, active: false, photo: params.rphoto.bytes)
        usr.save(flush: true, failOnError: true)
        return usr
//        render(view: "user")
    }

    //User Logged in and switch to dashboard
    def loginUser(params) {
        Users vale = Users.findByEmailAndPassword(params.logemail, params.logpassword)
        return vale
    }
}