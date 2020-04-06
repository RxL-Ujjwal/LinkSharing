package linksharing

import grails.converters.JSON
import grails.gorm.transactions.Transactional

@Transactional
class TopicService {
    def topicPage(params) {

        Topic topic = Topic.findById(params.topicId)

        List<Subscription> subscribedUsersOfThisTopic = Subscription.createCriteria().list {
            inList("topic", topic)
        }
        List<Resource> postsRelatedToThisTopic = Resource.findAllByTopic(topic)

        return [topic : topic, subscribedUsersOfThisTopic: subscribedUsersOfThisTopic,
                 postsRelatedToThisTopic: postsRelatedToThisTopic]
    }
    Topic createTopic(params,session){

        Users user = Users.findByEmail(session.getAttribute("email"))
        if(Topic.countByCreatedByAndName(user,params.name)){
            return null
        } else {
            Topic topic = new Topic(name: params.name, visibility: params.visibility, createdBy: user)
            Subscription sub = new Subscription(topic: topic,user:user,seriousness: Subscription.Seriousness.VerySerious.name())
            topic.addToSubscriptions(sub)
            return topic.save(flush: true, failOnError: true)
        }
    }
}