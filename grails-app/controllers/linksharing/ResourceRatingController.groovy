package linksharing

import grails.converters.JSON

class ResourceRatingController {

    ResourceRatingService resourceRatingService
    def index() { }

    def rating() {
        render([success:resourceRatingService.rating(session,params)] as JSON)
    }
}
