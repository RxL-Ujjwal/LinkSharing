package linksharing

import grails.converters.JSON
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*


class TopicController {

    TopicService topicService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index() {}

    def createTopic() {
        Users user = Users.findByEmail(session.getAttribute("email"))
        if (Topic.countByCreatedByAndName(user, params.name)) {
            render([success:false] as JSON)
        } else {
            Topic topic = new Topic(name: params.name, visibility: params.visibility, createdBy: user)
            Subscription sub = new Subscription(topic: topic, user: user, seriousness: Subscription.Seriousness.VerySerious.name())
            topic.addToSubscriptions(sub)
            topic.save(flush: true, failOnError: true)
            render([success : true] as JSON)
        }
    }

    def topicPage() {

        if (session.getAttribute("firstname")) {

            Topic topic = Topic.findById(params.topicId)

            List<Subscription> subscribedUsersOfThisTopic = Subscription.createCriteria().list {
                inList("topic", topic)
            }
            List<Resource> postsRelatedToThisTopic = Resource.findAllByTopic(topic)
            render(view: "topic", model: [topic : topic, subscribedUsersOfThisTopic: subscribedUsersOfThisTopic,
                                          postsRelatedToThisTopic: postsRelatedToThisTopic])
        } else {
            flash.message = "Please Login First"
            redirect(controller: "user")
        }
    }
}
