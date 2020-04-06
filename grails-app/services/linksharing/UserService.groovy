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

    //Show the Home Page
    def homePage(){
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
    def dashboard(session){
        Users user = Users.findByEmail(session.getAttribute("email"))

        List<Subscription> subscribedTopicsListOfUser = Subscription.findAllByUser(user)

        List<Topic> topicsCreatedByUser = Topic.findAllByCreatedBy(user)

        List<Resource> resourcesCreatedByUser = Resource.findAllByCreatedBy(user)

        List<Resource> trendingTopicsList = Resource.createCriteria().list(max: 5) {
            projections {
                count("id", "t")
            }
            groupProperty("topic")
            order("t", "desc")
        }

        List<Topic> topic = Topic.findAllByVisibility("Public")
        List<Resource> resourceListForInbox = Resource.createCriteria().list {
            and {
                not {
                    'in'("createdBy", user)
                }
                inList("topic", topic)
            }
            order("dateCreated", "desc")
        }
        return [subscribedTopicsListOfUser: subscribedTopicsListOfUser, topicsCreatedByUser: topicsCreatedByUser,
                                          resourcesCreatedByUser    : resourcesCreatedByUser, resourceListForInbox: resourceListForInbox,
                                          trendingTopicsList        : trendingTopicsList]
    }

    def postShow(params,session){
        Resource resource = Resource.get(params.resourceId)
        Users usr = Users.findByEmail(session.email)
        List<Topic> postsNotCreatedByUser = Topic.createCriteria().list {
            not {
                'in'("createdBy", usr)
            }
            order("dateCreated", "desc")
        }
        return([resource: resource, topicNotCreator: postsNotCreatedByUser])
    }
}