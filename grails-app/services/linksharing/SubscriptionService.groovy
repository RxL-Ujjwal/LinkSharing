package linksharing

import grails.gorm.transactions.Transactional

@Transactional
class SubscriptionService {

    def serviceMethod() {}

    boolean subscribe(params,session,flash){
        Users usr = Users.findByEmail(session.getAttribute("email"))
        Topic topic = Topic.get(params.topicId)
        List resources = Resource.findAllByTopic(topic)
        if(resources){
            resources.each{
                Resource resource ->
                    ReadingItem readingItem = new ReadingItem(user: usr,resource: resource,isRead: false)
                    readingItem.save(flush: true)
            }
        }
        Subscription subscription = new Subscription(topic: topic, user: usr, seriousness: Subscription.Seriousness.VerySerious.name())
        topic.addToSubscriptions(subscription)
        topic.save(failOnError: true, flush: true)
        flash.message = "You have subscribed the topic ${subscription.topic.name}"
        return true
    }

    boolean unsubscribe(params,session,flash) {
        Users usr = Users.findByEmail(session.getAttribute("email"))
        Topic topic = Topic.get(params.topicId)

        if (topic.createdBy == usr) {
            flash.message = "You cannot unsubscribe your own topic"
        } else {
            Subscription sub = Subscription.findByUserAndTopic(usr, topic)
            sub.delete(failOnError: true, flush: true)
            List<Resource> resource = Resource.findAllByTopic(topic)
            resource.each { readingItem ->
                List<ReadingItem> readingItems = ReadingItem.findAllByResourceAndUser(readingItem, usr)
                readingItems.each { items ->
                    items.delete(failOnError: true, flush: true)
                }
                flash.message = "You have successfully unsubscribed the topic ${sub.topic.name}"
            }
            return true
        }
    }


    Map subscribedTopicsList(session){
        Users user = Users.findByEmail(session.getAttribute("email"))
        List<Subscription> subscribedTopicsListOfUser = Subscription.createCriteria().list {
            inList("user", user)
            order("dateCreated", "desc")
        }
        return ([subscribedTopicsListOfUser: subscribedTopicsListOfUser])
    }

    Map userTopicsList(session) {
        Users user = Users.findByEmail(session.getAttribute("email"))
        List<Topic> userTopicsList = Topic.createCriteria().list() {
            inList("createdBy", user)
            order("name")
        }
        return([userTopicsList: userTopicsList])
    }

}