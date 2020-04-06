package linksharing

class ProfileController {

    ProfileService profileService

    def index() {
        if (session.email) {
            render(view: "/user/profile", model: profileService.profilePage(session))
        } else {
            flash.message = "Please Login First"
            redirect(controller: "user")
        }
    }

    def subscribe() {
        profileService.subscribe(params, flash)
        redirect(controller: "profile", action: "index")
    }

    def unsubscribe() {
        profileService.unsubscribe(params, flash)
        redirect(controller: "profile", action: "index")
    }

    def changeDetailsOfUser() {
        profileService.changeDetailsOfUser(params, session, flash)
        redirect(controller: "user", action: "dashboard")

    }

    def changePassword() {
        profileService.changePassword(params, session, flash)
        redirect(controller: "profile")
    }


    def userProfile() {
        if (session.getAttribute("firstname")) {
            render(view: "userProfile", model: profileService.userProfile(session))
        } else {
            flash.message = "Please Login First"
            redirect(controller: "user")
        }
    }
}


