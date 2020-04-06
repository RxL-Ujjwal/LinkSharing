package linksharing

import grails.converters.JSON

class ResourceRatingController {

    def index() { }

    def rating(){
        Resource resource = Resource.get(params.resourceId)
        Users user = Users.findByEmail(session.getAttribute("email"))
        ResourceRating resourceRating = ResourceRating.findByUserAndResource(user,resource)

        if(resourceRating){
            resourceRating.score = Integer.parseInt(params.value)
            resourceRating.save(flush:true , failOnError:true)
            render([success:false] as JSON)
        }else{
            ResourceRating rating = new ResourceRating(score: params.value,user:user,resource:params.resourceId)
            rating.save(flush:true,failOnError:true)
            render([success:true] as JSON)
        }
    }
}
