package linksharing

import grails.gorm.transactions.Transactional

@Transactional
class ProfileService {

    def serviceMethod() {}

    def profilePage(session) {
        Users usr = Users.findByEmail(session.getAttribute("email"))

        List<Subscription> subscribedTopicsListOfUser = Subscription.findAllByUser(usr)

        List<Topic> topicsCreatedByUser = Topic.findAllByCreatedBy(usr)

        List<Resource> resourcesCreatedByUser = Resource.findAllByCreatedBy(usr)

        return ([subscribedTopicsListOfUser: subscribedTopicsListOfUser,
                 topicsCreatedByUser       : topicsCreatedByUser, resourcesCreatedByUser: resourcesCreatedByUser])
    }

    def subscribe(params, flash) {
        Users usr = Users.findByEmail(params.email)
        Topic topic = Topic.findByCreatedByAndName(usr, params.topicname)
        Subscription sub = new Subscription(topic: topic, user: usr, seriousness: Subscription.Seriousness.VerySerious.name())
        topic.addToSubscriptions(sub)
        topic.save(failOnError: true, flush: true)
        flash.message = "You have subscribed the topic ${sub.topic.name}"
        return true
    }

    def unsubscribe(params, flash) {
        Users user = Users.findByEmail(params.email)
        Topic topic = Topic.findByCreatedByAndName(user, params.topicname)
        if (topic.createdBy == user) {
            flash.message = "You cannot unsubscribe this topic"
        } else {
            Subscription sub = Subscription.findByUsersAndTopic(user, topic)
            sub.delete(failOnError: true, flush: true)
            flash.message = "You have successfully unsubscribed the topic ${sub.topic.name}"
        }
        return true
    }

    def changeDetailsOfUser(params, session, flash) {
        Users user = Users.findByEmail(session.getAttribute("email"))
        user.firstName = params.fname
        user.lastName = params.lname
        user.username = params.uname
        user.photo = params.photo.bytes
        user.save(flush: true, failOnError: true)

        session.setAttribute("firstname", user.firstName)
        session.setAttribute("lastname", user.lastName)
        session.setAttribute("username", user.username)
        String encode = Base64.getEncoder().encodeToString(user.photo)
        session.setAttribute("photo", encode)

        flash.message = "Your profile has been updated"
        return true
    }

    def changePassword(params, session, flash) {
        Users user = Users.findByEmail(session.getAttribute("email"))
        if (params.pass == params.cpass) {
            user.password = params.pass
            user.save(flush: true, failOnError: true)
            flash.message = "Your password has been updated"
        } else {
            flash.message = "Password Mismatch"
        }
        return true
    }

    def userProfile(session) {
        Users usr = Users.findByEmail(session.getAttribute("email"))

        List<Subscription> subscribedTopicsListOfUser = Subscription.findAllByUser(usr)
        List<Resource> resourcesCreatedByUser = Resource.findAllByCreatedBy(usr)
        List<Topic> topicsCreatedByUser = Topic.findAllByCreatedBy(usr)

        return ([subscribedTopicsListOfUser: subscribedTopicsListOfUser,
                 topicsCreatedByUser       : topicsCreatedByUser, resourcesCreatedByUser: resourcesCreatedByUser])
    }
}
