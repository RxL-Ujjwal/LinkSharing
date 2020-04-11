package linksharing

import grails.converters.JSON

class ReadingItemController {

    ReadingItemService readingItemService

    def index() {}

    def isRead(session, params) {
        render([success: readingItemService.isRead(session, params)] as JSON)
    }

    def searchPage() {

        if (session.getAttribute("firstname")) {
            List<Resource> trendingTopicsList = Resource.createCriteria().list(max: 5) {
                projections {
                    count("id", "t")
                }
                groupProperty("topic")
                order("t", "desc")
            }

            List<ResourceRating> topPosts = ResourceRating.createCriteria().list(max: 5) {
                order "score", "desc"
            }

            List<Topic> topics = Topic.findAllByNameIlike(params.searchText) ?: []
            List<Resource> resources = Resource.findAllByDescriptionIlike(params.searchText)?: []

            render(view: "search", model: [topPosts          : topPosts, resources: resources,topics : topics,
                                           trendingTopicsList: trendingTopicsList])
        } else {
            flash.error = "Please Login First"
            redirect(controller: "user")
        }
    }
}
