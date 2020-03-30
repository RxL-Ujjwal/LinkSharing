package linksharing

class ResourceController {

    def index() { }

    def shareLink(){
        Users usr = Users.findByEmail(session.getAttribute("email"))
        Topic t = Topic.findByName(params.linkTopic)
        Resource resource = Resource.findByTopicAndCreatedBy(t,usr)
        LinkResource lr = new LinkResource(description: params.descriptl, url: params.link)
        if(resource!=null){
            resource.addToLinkResource(lr)
            resource.save(flush:true,failOnError:true)
        }else {
            Resource res = new Resource(description: params.descriptl, createdBy: usr, topic: t)
            res.addToLinkResource(lr)
            res.save(flush:true,failOnError:true)
        }
        flash.message = "Link Resource added"
        redirect(controller:"user",action:"dashboard")
        return true
    }
    def shareDoc(){

        Users user = Users.findByUsername(session.getAttribute("username"))
        Topic topic = Topic.findByName(params.docTopic)
        Resource resource=Resource.findByTopicAndCreatedBy(topic,user)
        def file1=request.getFile("document")
        String dir1=new Date()
        String dir2=dir1.split(" ").join("")
        String dir= "/home/ujjwal/GrailsProject/gitlinksharing/LinkSharing/DocumentResource/${session.getAttribute("username")}${dir2}.pdf"
        file1.transferTo(new File(dir))
        DocumentResource dr=new DocumentResource(filepath:dir,description:params.descriptd)
        if(resource==null){
            Resource res=new Resource(description:params.descriptd,createdBy: user, topic: topic)
            res.addToDocumentResource(dr)
            topic.addToResources(res)
            topic.save(flush:true,failOnError: true)
        }
        else{
            resource.addToDocumentResource(dr)
            topic.addToResources(resource)
            println(dr.properties)
            topic.save(flush:true,failOnError: true)
        }
        flash.message="Document resource added"
        redirect(controller:"user",action:"dashboard")
        return true
    }
}
