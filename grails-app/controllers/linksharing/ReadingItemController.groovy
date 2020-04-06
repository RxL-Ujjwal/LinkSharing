package linksharing

import grails.converters.JSON

class ReadingItemController {

    def index() { }

    def isRead(){

        Users usr = Users.get(params.userId)
        Resource resource = Resource.get(params.resourceId)
        ReadingItem readingItem = new ReadingItem(user: usr, resource: resource, isRead: params.isState)
        readingItem.save(flush: true,failOnError: true)
        redirect(controller:"user",action:"dashboard")

    }
}
