package linksharing

import grails.converters.JSON

class ResourceController {

    ResourceService resourceService

    def index() { }

    def shareLink(){
        resourceService.shareLink(params,session,flash)
        redirect(controller:"user",action:"dashboard")
    }
    def shareDoc(){
        resourceService.shareDoc(params,session,flash,request)
        redirect(controller:"user",action:"dashboard")
    }

    def download(){
        DocumentResource documentResource = DocumentResource.get(params.docResourceId)
        File file = new File(documentResource.filepath)
        byte[] orderPDF = file.bytes
        response.setHeader("Content-disposition","attachment;filename = "+file.name)
        response.contentType = "application/octet-stream"
        response.contentLength = orderPDF.length
        response.outputStream<<orderPDF
        response.outputStream.flush()
        response.outputStream.close()
    }

    def deletePost(){
        Resource resource = Resource.findById(params.postId)
        println params.postId
        List<ReadingItem> readingItems = ReadingItem.findAllByResource(resource)
        readingItems.each { items ->
            items.delete(failOnError: true, flush: true)
        }
        List<ResourceRating> resourceRatings = ResourceRating.findAllByResource(resource)
        resourceRatings.each { rr ->
            rr.delete(failOnError: true, flush: true)
        }
        resource.delete(flush:true,failOnError: true)
        render([success:true] as JSON)
    }
}
