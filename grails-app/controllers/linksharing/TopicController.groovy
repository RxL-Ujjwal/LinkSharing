package linksharing

import grails.converters.JSON

class TopicController {

    TopicService topicService

    static allowedMethods = [save: "POST", update: "PUT"]

    def index() {}

    def createTopic() {
        render([success : topicService.createTopic(params,session) ? true:false] as JSON)
        }

    def topicPage() {

        if (session.getAttribute("firstname")) {
            Map model = topicService.topicPage(params)
            render(view: "topic", model: model)
        } else {
            flash.error = "Please Login First"
            redirect(controller: "user")
        }
    }

    def delete() {
        render([success:topicService.delete(params)] as JSON)
    }

    def invite() {
        sendMail {
            to params.address
            subject params.subject
            text params.body
        }
        flash.message = "Message sent to " + params.address + " at " + new Date()
        redirect action: "show"
    }

    def changeTopicSeriousness(){
        render([success:topicService.changeTopicSeriousness(params,session)] as JSON)
    }

    def changeTopicVisibility(){
        render([success:topicService.changeTopicVisibility(params,session)] as JSON)
    }
}
