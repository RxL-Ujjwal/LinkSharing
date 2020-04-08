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
        println(params.docResouceId+"********")
        File file = new File(documentResource.filepath)
        byte[] orderPDF = file.bytes
        response.setHeader("Content-disposition","attachment;filename = "+file.name)
        response.contentType = "application/octet-stream"
        response.contentLength = orderPDF.length
        response.outputStream<<orderPDF
        response.outputStream.flush()
        response.outputStream.close()
    }
}
