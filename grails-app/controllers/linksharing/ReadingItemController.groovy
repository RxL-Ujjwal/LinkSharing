package linksharing

import grails.converters.JSON

class ReadingItemController {

    def index() { }

    def isRead(){

        Users usr = Users.get(session.userId)
        Resource resource = Resource.get(params.resourceId)
        ReadingItem readingItem = ReadingItem.findByResourceAndUser(resource,usr)
        if (readingItem) {
            readingItem.isRead = true
            readingItem.save(flush: true)
        }
        redirect(controller:"user",action:"dashboard")
    }
}
