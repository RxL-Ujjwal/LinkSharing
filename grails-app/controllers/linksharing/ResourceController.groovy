package linksharing

import grails.converters.JSON

class ResourceController {

    def index() { }

    def shareLink(){
        Users usr = Users.findByEmail(session.getAttribute("email"))
        Topic t = Topic.findByName(params.linkTopic)
        LinkResource lr = new LinkResource(url:params.link,description: params.descriptl,createdBy: usr,topic: t)
        lr.save(flush:true,failOnError:true)
        flash.message = "Link Resource added"
        redirect(controller:"user",action:"dashboard")
    }
    def shareDoc(){

        Users usr = Users.findByUsername(session.getAttribute("username"))
        Topic t = Topic.findByName(params.docTopic)
        def file1=request.getFile("document")
        String dir1=new Date()
        String dir2=dir1.split(" ").join("")
        String dir= "/home/ujjwal/GrailsProject/gitlinksharing/LinkSharing/DocumentResource/${session.getAttribute("username")}${dir2}.pdf"
        file1.transferTo(new File(dir))
        DocumentResource dr=new DocumentResource(filepath:dir,description:params.descriptd,createdBy: usr,topic: t)
        dr.save(flush:true,failOnError: true)
        flash.message="Document resource added"
        redirect(controller:"user",action:"dashboard")
        return true
    }

    def rating(){
        Resource resource = Resource.get(params.resourceId)
        Users usr = Users.findByEmail(session.getAttribute("email"))
        ResourceRating res = ResourceRating.findByUserAndResource(usr,resource)

        if(res){
            res.score = Integer.parseInt(params.value)
            res.save(flush:true , failOnError:true)
            render([success:false] as JSON)
        }else{
            ResourceRating rating = new ResourceRating(score: params.value,user:usr,resource:params.resourceId)
            rating.save(flush:true,failOnError:true)
            render([success:true] as JSON)
        }
    }

    def download(){
        DocumentResource dr = DocumentResource.get(params.docResourceId)
        File file = new File(dr.filepath)
        byte[] orderPDF = file.bytes
        response.setHeader("Content-disposition","attachment;filename = "+file.name)
        response.contentType = "application/octet-stream"
        response.contentLength = orderPDF.length
        response.outputStream<<orderPDF
        response.outputStream.flush()
        response.outputStream.close()
    }
    def isRead(){
        Users usr = Users.get(params.userId)
        Resource resource = Resource.get(params.resourceId)
        ReadingItem itemRead = new ReadingItem(user: usr,resource: resource,isRead: params.value)
        itemRead.save(flush:true,failOnError:true)
        render([success:true] as JSON)
    }
}
