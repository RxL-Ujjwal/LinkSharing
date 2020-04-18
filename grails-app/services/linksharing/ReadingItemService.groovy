package linksharing

import grails.converters.JSON
import grails.gorm.transactions.Transactional

@Transactional
class ReadingItemService {

    def serviceMethod() { }

    boolean isRead(session,params){

        Resource resource = Resource.get(params.resourceId)
        Users user = Users.findByEmail(session.email)
        if(resource!=null){
            ReadingItem readingItem = ReadingItem.findByResourceAndUser(resource,user)
            readingItem.isRead=true
            readingItem.save(flush: true,failOnError: true)
            println readingItem.properties
            return true
        } else{
            return false
        }
    }
}
