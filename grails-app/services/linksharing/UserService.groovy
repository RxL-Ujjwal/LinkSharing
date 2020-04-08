package linksharing

import grails.gorm.transactions.Transactional

@Transactional
class UserService {

    def serviceMethod() {}

    //Register User in the Database
    def registerUser(params, flash) {
        Users userByEmail = Users.findByEmail(params.remail)
        Users userByUsername = Users.findByUsername(params.runame)
        String result
        if (userByEmail != null && userByUsername != null) {
            flash.error = "Email and Username both existed"
        } else {
            if (userByEmail != null) {
                flash.error = "Email existed"
            } else {
                if (userByUsername != null) {
                    flash.error = "Username existed"
                } else {
                    Users usr = new Users(email: params.remail, username: params.runame, password: params.rpassword, firstName: params.rfname, lastName: params.rlname, admin: false, active: true, photo: params.rphoto.bytes)
                    usr.save(flush: true, failOnError: true)
                    flash.message = "Registration Successful"
                }
            }
        }
    }

//User Logged in and switch to dashboard
    def loginUser(params) {
        Users loggedInUser = Users.findByEmailAndPassword(params.logemail, params.logpassword)
        if (loggedInUser == null) {
            Users logInUser = Users.findByUsernameAndPassword(params.logemail, params.logpassword)
            loggedInUser = logInUser
        }
        return loggedInUser
    }

//Show the Home Page
    Map homePage() {

        List<Topic> topic = Topic.findAllByVisibility("Public")
        List<Resource> recentSharesPublicList = Resource.createCriteria().list(max: 5) {
            inList("topic", topic)
            order("dateCreated", "desc")
        }
        List<ResourceRating> topPosts = ResourceRating.createCriteria().list(max: 5) {
            order "score", "desc"
        }

        return ([recentSharesPublicList: recentSharesPublicList, topPosts: topPosts])
    }

//Take the User to Dashboard after Login
    def dashboard(session) {
        Users user = Users.findByEmail(session.getAttribute("email"))

        List<Subscription> subscribedTopicsListOfUser = Subscription.createCriteria().list {
            inList("user", user)
            order("dateCreated", "desc")
        }

        List<Resource> trendingTopicsList = Resource.createCriteria().list(max: 5) {
            projections {
                count("id", "t")
            }
            groupProperty("topic")
            order("t", "desc")
        }

        List<Resource> resources
        List<Topic> subscribedTopics = Subscription.findAllByUser(user)?.topic
        if (subscribedTopics) {
            resources = Resource.createCriteria().list() {
                'in'("topic.id", subscribedTopics?.id)
                ne("createdBy.id", user.id)
            }
        }
        List<ReadingItem> readingItems
        if (resources) {
            readingItems = ReadingItem.createCriteria().list() {
                eq("isRead", false)
                'in'("resource.id", resources?.id)
            }
        }
        return [subscribedTopicsListOfUser: subscribedTopicsListOfUser,
                resourceListForInbox      : readingItems,
                trendingTopicsList        : trendingTopicsList]
    }

    def postShow(params, session) {
        Resource resource = Resource.get(params.resourceId)
        Users usr = Users.findByEmail(session.email)
        List<Topic> postsNotCreatedByUser = Topic.createCriteria().list {
            not {
                'in'("createdBy", usr)
            }
            order("dateCreated", "desc")
        }
        return ([resource: resource, topicNotCreator: postsNotCreatedByUser])
    }

}