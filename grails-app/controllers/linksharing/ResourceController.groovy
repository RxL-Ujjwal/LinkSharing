package linksharing

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
}
