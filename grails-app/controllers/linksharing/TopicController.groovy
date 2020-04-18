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
            Map model = topicService.topicPage(params,session,flash)
            if(model) {
                render(view: "topic", model: model)
            }else{
                //flash.error = "Sorry the Topic is Private"
                redirect(controller: "user",action: "dashboard")
            }
        } else {
            flash.error = "Please Login First"
            redirect(controller: "user")
        }
    }

    def delete() {
        render([success:topicService.delete(params)] as JSON)
    }

    def changeTopicSeriousness(){
        render([success:topicService.changeTopicSeriousness(params,session)] as JSON)
    }

    def changeTopicVisibility(){
        render([success:topicService.changeTopicVisibility(params,session)] as JSON)
    }

    def changeTopicName() {
        render([success:topicService.changeTopicName(params,session)] as JSON)
    }
}
