package linksharing

import grails.gorm.transactions.Transactional

@Transactional
class ResourceService {

    def serviceMethod() {}

    def shareLink(params,session,flash){
        Users usr = Users.findByEmail(session.getAttribute("email"))
        Topic t = Topic.findByName(params.linkTopic)
        LinkResource lr = new LinkResource(url:params.link,description: params.descriptl,createdBy: usr,topic: t)
        lr.save(flush:true,failOnError:true)
        flash.message = "Link Resource added"
        return true
    }

    def shareDoc(params,session,flash,request){
        Users user = Users.findByUsername(session.getAttribute("username"))
        Topic t = Topic.findByName(params.docTopic)
        def file1=request.getFile("document")
        String dir1=new Date()
        String dir2=dir1.split(" ").join("")
        String dir= "/home/ujjwal/GrailsProject/gitlinksharing/LinkSharing/DocumentResource/${session.getAttribute("username")}${dir2}.pdf"
        file1.transferTo(new File(dir))
        DocumentResource documentResource=new DocumentResource(filepath:dir,description:params.descriptd,createdBy: user,topic: t)
        documentResource.save(flush:true,failOnError: true)
        flash.message="Document resource added"
        return true
    }
}
