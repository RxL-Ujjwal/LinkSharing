package linksharing

class LinkSharingTagLib {
    // static defaultEncodeAs = [taglib:'html']
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]
    static namespace = "ls"

    def subscriptionCount = { Map attributes ->
        if (attributes.userId) {
            Users user = Users.get(attributes.userId)
            Integer numberOfTopicsForThisUser = Subscription.countByUser(user)
            out << "<a href=${createLink(controller: "profile", action: "userProfile", params: [userId: attributes.userId])}>${numberOfTopicsForThisUser}</a>"
        }
        if (attributes.topicId) {
            Topic topic = Topic.get(attributes.topicId)
            Integer numberOfSubscriptionsForThisTopic = Subscription.countByTopic(topic)
            out << numberOfSubscriptionsForThisTopic
        }
    }

    def topicCount = { Map attributes ->
        Users usr = Users.get(attributes.userId)
        Integer numberOfTopicsCreatedByThisUser = Topic.countByCreatedBy(usr)
        out << "<a href=${createLink(controller: "profile", action: "userProfile", params: [userId: attributes.userId])}>${numberOfTopicsCreatedByThisUser}</a>"
    }

    def postCount = { Map attributes ->
        Topic topic = Topic.get(attributes.topicId)
        Integer numberOfPostsCreatedOnThisTopic = Resource.countByTopic(topic)
        out << numberOfPostsCreatedOnThisTopic
    }

    def showSubscribe = { Map attributes ->
        Users usr = Users.get(attributes.userId)
        Topic topic = Topic.get(attributes.topicId)
        int isSubscribed = Subscription.countByUserAndTopic(usr, topic)
        String action = isSubscribed ? "unsubscribe" : "subscribe"
        String text = isSubscribed ? "unsubscribe" : "subscribe"
        out << "<a href =${createLink(controller: "subscription", action: action, params: [topicId: attributes.topicId])}>${text}</a>"
    }

    def showSubscribedTopics = { Map attributes ->
        Users user = Users.get(attributes.userId)
        List<Topic> subscribedTopics = Subscription.findAllByUser(user)?.topic
        out << select(from:subscribedTopics ,  optionKey:"id", optionValue:"name", name:"linkTopic")
    }
}
