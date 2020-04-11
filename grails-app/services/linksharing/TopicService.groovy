package linksharing

import grails.converters.JSON
import grails.gorm.transactions.Transactional

@Transactional
class TopicService {
    Map topicPage(params,session,flash) {

        Users usr = Users.findByEmail(session.email)
        Topic topic = Topic.findById(params.topicId)

        List<Subscription> subscribedUsersOfThisTopic = Subscription.createCriteria().list {
            inList("topic", topic)
            order("dateCreated","desc")
        }
        List<Resource> postsRelatedToThisTopic = Resource.findAllByTopic(topic)
        println(topic.visibility.name())
        if (topic.visibility.name()=="Public") {
            return [topic                  : topic, subscribedUsersOfThisTopic: subscribedUsersOfThisTopic,
                    postsRelatedToThisTopic: postsRelatedToThisTopic]
        } else {
            if ((topic.visibility.name()=="Private" && topic.createdBy==usr) || (topic.visibility.name()=="Private" && session.admin)) {
                return [topic                  : topic, subscribedUsersOfThisTopic: subscribedUsersOfThisTopic,
                        postsRelatedToThisTopic: postsRelatedToThisTopic]
            }else {
                flash.error = "Sorry the Topic is Private"
                return [:]
            }
        }
    }

    Topic createTopic(params, session) {

        Users user = Users.findByEmail(session.getAttribute("email"))
        if (Topic.countByCreatedByAndName(user, params.name)) {
            return null
        } else {
            Topic topic = new Topic(name: params.name, visibility: params.visibility, createdBy: user)
            Subscription sub = new Subscription(topic: topic, user: user, seriousness: Subscription.Seriousness.VerySerious.name())
            topic.addToSubscriptions(sub)
            return topic.save(flush: true, failOnError: true)
        }
    }

    boolean delete(params) {

        Topic topic = Topic.get(params.topicId)
        List<Resource> resource = Resource.findAllByTopic(topic)
        resource.each { readingItem ->
            List<ReadingItem> readingItems = ReadingItem.findAllByResource(readingItem)
            readingItems.each { items ->
                items.delete(failOnError: true, flush: true)
            }
            List<ResourceRating> resourceRatings = ResourceRating.findAllByResource(readingItem)
            resourceRatings.each { rr ->
                rr.delete(failOnError: true, flush: true)
            }
            readingItem.delete(failOnError: true, flush: true)
        }
        List<Subscription> subscriptions = Subscription.findAllByTopic(topic)
        subscriptions.each { sub ->
            sub.delete(failOnError: true, flush: true)
        }
        topic.delete(failOnError: true, flush: true)
        return true
    }

    boolean changeTopicSeriousness(params, session) {
        Topic topic = Topic.get(params.topicId)
        if (session.admin || session.username == topic.createdBy.username) {
            Users user = Users.findByUsername(session.username)
            Subscription subscription = Subscription.findByTopicAndUser(topic, user)
            subscription.seriousness = params.topicSeriousness
            subscription.save(flush: true, failOnError: true)
            return true
        } else {
            return false
        }
    }

    boolean changeTopicVisibility(params, session) {
        Topic topic = Topic.get(params.topicId)
        if (session.admin || session.username == topic.createdBy.username) {
            topic.visibility = params.topicVisibility
            topic.save(flush: true, failOnError: true)
            return true
        } else {
            return false
        }
    }

    boolean changeTopicName(params,session){
        Topic topic = Topic.get(params.topicId)
        if (session.admin || session.username == topic.createdBy.username) {
            Users user = Users.findByUsername(session.username)
            topic.name = params.topicName
            topic.save(flush: true, failOnError: true)
            return true
        } else {
            return false
        }
    }
}