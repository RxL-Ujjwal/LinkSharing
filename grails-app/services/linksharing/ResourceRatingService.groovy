package linksharing

import grails.converters.JSON
import grails.gorm.transactions.Transactional

@Transactional
class ResourceRatingService {

    def serviceMethod() {}

    boolean rating(session,params){
        Resource resource = Resource.get(params.resourceId)
        Users user = Users.findByEmail(session.getAttribute("email"))
        ResourceRating resourceRating = ResourceRating.findByUserAndResource(user,resource)

        if(resourceRating){
            resourceRating.score = Integer.parseInt(params.value)
            resourceRating.save(flush:true , failOnError:true)
            return true
        }else{
            ResourceRating rating = new ResourceRating(score: params.value,user:user,resource:params.resourceId)
            rating.save(flush:true,failOnError:true)
            return false
        }
    }
}
