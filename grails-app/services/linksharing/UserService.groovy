package linksharing

import grails.gorm.transactions.Transactional

@Transactional
class UserService {

    def serviceMethod() {}

    //Register User in the Database
    def registerUser(params) {

        Users usr = new Users(email: params.remail, username: params.runame, password: params.rpassword, firstName: params.rfname, lastName: params.rlname, admin: true, active: true, photo: params.rphoto.bytes)
        usr.save(flush: true, failOnError: true)
        return usr
    }

    //User Logged in and switch to dashboard
    def loginUser(params) {
        Users loggedInUser = Users.findByEmailAndPassword(params.logemail, params.logpassword)
        return loggedInUser
    }
}