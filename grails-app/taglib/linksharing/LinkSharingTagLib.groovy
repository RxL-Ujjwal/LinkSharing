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

    def markAsRead = { Map attributes ->
        boolean isState = true
        Users usr = Users.get(attributes.userId)
        Resource resource = Resource.get(attributes.resourceId)
        ReadingItem itemRead = ReadingItem.findByResourceAndUser(resource, usr)
        if (itemRead)
            isState = itemRead.isRead
        String markAsReadString = "Mark as Read"
        String markAsUnreadString = "Mark as Unread"
        String text = isState ? markAsReadString : markAsUnreadString
        boolean readingStateValue = (text == "Mark as Read") ? false : true
        out << "<a href=${createLink(controller: "readingItem", action: "isRead", params: [userId: attributes.userId, resourceId: attributes.resourceId, isState: readingStateValue])}><u>${text}</u></a>"
    }

}
