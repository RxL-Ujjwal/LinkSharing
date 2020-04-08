package linksharing

import grails.gorm.transactions.Transactional

@Transactional
class SubscriptionService {

    def serviceMethod() {}

    boolean subscribe(params,session,flash){
        Users usr = Users.findByEmail(session.getAttribute("email"))
        Topic topic = Topic.get(params.topicId)
        Subscription subscription = new Subscription(topic: topic, user: usr, seriousness: Subscription.Seriousness.VerySerious.name())
        topic.addToSubscriptions(subscription)
        topic.save(failOnError: true, flush: true)

        List<Resource> resources = Resource.findAllByTopic(topic)
        resources.each { res ->
            ReadingItem readingItem = new ReadingItem(user: usr, resource: res, isRead: false)
            res.addToReadingItem(readingItem)
            res.save(flush: true, failOnError: true)
        }
        flash.message = "You have subscribed the topic ${subscription.topic.name}"
        return true
    }

    boolean unsubscribe(params,session,flash){
        Users usr = Users.findByEmail(session.getAttribute("email"))
        Topic topic = Topic.get(params.topicId)
        if (topic.createdBy == usr) {
            flash.message = "You cannot unsubscribe your own topic"
        } else {
            Subscription sub = Subscription.findByUserAndTopic(usr, topic)
            sub.delete(failOnError: true, flush: true)
            flash.message = "You have successfully unsubscribed the topic ${sub.topic.name}"
        }
        return true
    }

    Map subscribedTopicsList(session){
        Users user = Users.findByEmail(session.getAttribute("email"))
        List<Subscription> subscribedTopicsListOfUser = Subscription.createCriteria().list {
            inList("user", user)
            order("dateCreated", "desc")
        }
        return ([subscribedTopicsListOfUser: subscribedTopicsListOfUser])
    }

    Map trendingTopicsList(session) {
        List<Resource> trendingTopicsList = Resource.createCriteria().list {
            projections {
                count("id", "t")
            }
            groupProperty("topic")
            order("t", "desc")
        }
        return([trendingTopicsList: trendingTopicsList])
    }

    Map userTopicsList(session) {
        Users user = Users.findByEmail(session.getAttribute("email"))
        List<Topic> userTopicsList = Topic.createCriteria().list() {
            inList("createdBy", user)
            order("dateCreated", "desc")
            order("name")
        }
        return([userTopicsList: userTopicsList])
    }

}